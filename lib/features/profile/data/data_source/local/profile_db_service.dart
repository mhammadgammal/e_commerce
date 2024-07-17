import 'dart:async';

import 'package:e_commerce/core/database/db_helper.dart';

import '../../../../../core/data/user_model.dart';

abstract interface class ProfileDbServiceInterface {
  Future getUser();
  void addUser(UserModel user);
  Future updateUser(UserModel user);
  void deleteUser();
}

class ProfileDbService implements ProfileDbServiceInterface {
  @override
  void deleteUser() {
    DbHelper.getBox('user').then((value) => value.clear());
  }

  @override
  Future<UserModel?> getUser() =>
      DbHelper.getBox('user').then((value) => value.get(0) as UserModel);

  @override
  void addUser(UserModel user) {
    print('save to db');

    DbHelper.getBox('user').then((value) async {
      print('in then');
      int insertionResult = await value.add(user);
      print('insertion Result: $insertionResult');
      return value.add(user);
    });
  }

  @override
  Future updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
