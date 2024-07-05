import 'package:e_commerce/features/authentication/domain/usecase/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/register_params.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUsecase) : super(RegisterInitialState());

  final RegisterUsecase registerUsecase;
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  // #region controllers
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // #endregion

  // #region validators

  String? validateFirstName(String? name) =>
      name == null || name.isEmpty ? 'Please enter your first name' : null;
  String? validateLastName(String? name) =>
      name == null || name.isEmpty ? 'Please enter your last name' : null;
  String? validateEmail(String? email) => email == null || email.isEmpty
      ? 'Please enter your email address'
      : !(email.contains('@'))
          ? 'Please enter @ to be valid email address'
          : null;

  String? validatePassword(String? password) =>
      password == null || password.isEmpty
          ? 'Password cannot be empty'
          : password.length < 8
              ? 'Password must be at least 8 characters'
              : null;
  // #endregion
  void register({bool withGoogle = false}) {
    if (withGoogle) {
      emit(RegisterGoogleLoadingState());
      registerWihGoogle();
    }
    var name = '${firstNameController.text} ${lastNameController.text}';

    registerUsecase.perform(
      RegisterParams(
        name: name,
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
      ),
    );
  }

  void registerWihGoogle() {}
}
