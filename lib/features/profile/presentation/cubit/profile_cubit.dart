import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_local_usecase.dart';
import 'package:e_commerce/features/profile/domain/usecase/logout_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileLocalUsecase _getProfileLocalUsecase;
  final LogoutUsecase _logoutUsecase;
  ProfileCubit(this._getProfileLocalUsecase, this._logoutUsecase)
      : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? user;

  bool isModified = false;
  List<(Widget, String, String)> profileGroup = [];
  List<(Widget, String)> myAccountSection = [
    (const Icon(Icons.location_on), 'Addresses'),
    (const Icon(Icons.payment), 'Payments'),
  ];

  List<(Widget, String)> settingsSection = [
    (const Icon(Icons.language), 'Country'),
    (const Icon(Icons.flag), 'Language'),
  ];
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;

  late TextEditingController emailController;

  late TextEditingController phoneController;
  late TextEditingController currentPasswordController;

  late TextEditingController newPasswordController;

  late TextEditingController confirmNewPasswordController;

  void getUserData() async {
    user = await _getProfileLocalUsecase.perform(null);
    print(user);
    _prepareTextFields();
    emit(UserLoadedSuccessState());
  }

  void _prepareTextFields() {
    var userName = user!.name;
    var firstName = userName.split(' ')[0];
    var lastName = userName.split(' ')[1];
    firstNameController = TextEditingController(text: firstName);
    lastNameController = TextEditingController(text: lastName);
    emailController = TextEditingController(text: user!.email);
    phoneController = TextEditingController(text: user!.phone);
    emit(ProfileEditTextFieldsPreparedState());
  }

  void prepareProfileGroup() {
    profileGroup = [
      (Image.asset(AppImages.ordersIc), 'Orders', 'Manage & track'),
      (Image.asset(AppImages.returnIc), 'Returns', '0 active requests'),
      (Image.asset(AppImages.sallaCreditsIc), 'Salla Credits', 'EGP 0.00'),
      (Image.asset(AppImages.wishlistIc), 'Wishlist', '0 saved items'),
    ];

    emit(ProfileGroupLoadedSuccessState());
  }

  void logout() async {
    try {
      _logoutUsecase.perform(null);
      emit(LogoutSucessState());
    } catch (e) {
      print(e);
      emit(LogoutFailureState());
    }
  }

  onFirstNameValueChged(String value) {
    var firstName = user!.name.split(' ')[0];
    if (value.trim() == firstName) {
      isModified = false;
      emit(ModificationState());
    } else {
      isModified = true;
      emit(ModificationState());
    }
  }

  onLastNameValueChanged(String value) {
    var lastName = user!.name.split(' ')[1];
    if (value.trim() == lastName) {
      isModified = false;
      emit(ModificationState());
    } else {
      isModified = true;
      emit(ModificationState());
    }
  }

  onPhoneNumberChanged(String value) {
    if (value.trim() == user!.phone) {
      isModified = false;
      emit(ModificationState());
    } else {
      isModified = false;
      emit(ModificationState());
    }
  }
}
