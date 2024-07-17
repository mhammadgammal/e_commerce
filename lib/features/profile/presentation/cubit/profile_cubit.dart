import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_local_usecase.dart';
import 'package:e_commerce/features/profile/domain/usecase/get_profile_remote_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileLocalUsecase _getProfileLocalUsecase;
  GetProfileRemoteUsecase _getProfileRemoteUsecase;
  ProfileCubit(
    this._getProfileLocalUsecase,
    this._getProfileRemoteUsecase,
  ) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? user;

  List<(Widget, String, String)> profileGroup = [];
  List<(Widget, String)> myAccountSection = [
    (Icon(Icons.location_on), 'Addresses'),
    (Icon(Icons.payment), 'Payments'),
  ];

  List<(Widget, String)> settingsSection = [
    (Icon(Icons.language), 'Country'),
    (Icon(Icons.flag), 'Language'),
  ];
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  void getUserData() async {
    user = await _getProfileLocalUsecase.perform(null);
    print(user);
    emit(UserLoadedSuccessState());
  }

  void prepareTextFields() {
    nameController.text = user!.name;
    emailController.text = user!.email;
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
}
