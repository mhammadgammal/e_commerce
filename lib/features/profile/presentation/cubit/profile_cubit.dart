import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_local_usecase.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_remote_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  GetProfileLocalUsecase _getProfileLocalUsecase;
  GetProfileRemoteUsecase _getProfileRemoteUsecase;
  ProfileCubit(
    this._getProfileLocalUsecase,
    this._getProfileRemoteUsecase,
  ) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  late UserModel userModel;
  TextEditingController nameController = TextEditingController(
    text: '',
  );

  TextEditingController emailController = TextEditingController(
    text: '',
  );

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void getUserData() async{
    userModel = await _getProfileLocalUsecase.perform(null);
    print(userModel);
  }
}
