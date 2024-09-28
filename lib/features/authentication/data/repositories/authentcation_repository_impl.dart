import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/core/database/db_helper.dart';
import 'package:e_commerce/features/authentication/data/network/authentication_api_service.dart';
import 'package:e_commerce/features/authentication/domain/entity/register_params.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repo/authentication_repo.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApiServiceImpl _authenticationApiServiceImpl;

  AuthenticationRepositoryImpl(this._authenticationApiServiceImpl);

  @override
  Future<UserModel?> login(RegisterParams params) async {
    try {
      final response = await _authenticationApiServiceImpl.login(
          params.email, params.password);
      print('login response: $response');
      if (response.data['data'] != null) {
        var user = UserModel.fromJson(response.data['data']);
        _saveToDb(user);
        return user;
      }
    } catch (e) {
      print('login error: $e');
    }

    return null;
  }

  Future<void> _saveToDb(UserModel user) async {
    print('save to db');

    DbHelper.getBox('user').then((value) async {
      print('in then');
      int insertionResult = await value.add(user);
      print('insertion Result: $insertionResult');
      return value.add(user);
    });
  }

  @override
  Future<UserModel?> register(RegisterParams params) async {
    try {
      final response = await _authenticationApiServiceImpl.register(params);

      print('register response: $response');
      if (response.data['data'] != null) {
        return UserModel.fromJson(response.data['data']);
      }
    } on DioException catch (e) {
      print('register error: $e');
    }
    return null;
  }

  Future<Either<User?, String>> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      var userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Left(userCred.user);
    } on FirebaseAuthException catch (err) {
      return Right(err.code);
    }
  }
}
