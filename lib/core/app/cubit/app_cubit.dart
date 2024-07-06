import 'package:e_commerce/core/router/router_helper.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final searchController = TextEditingController();

  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<(Widget, String, String)> screens = [
    (const Icon(Icons.home, size: 30,), 'Home', RouterHelper.home),
    (
      Image.asset(AppImages.categoriesIc, width: 30.0, height: 30.0),
      'Categories',
      RouterHelper.categories
    ),
    (const Icon(Icons.person_2_outlined, size: 30,), 'Profile', RouterHelper.profile),
    (
      const Icon(Icons.shopping_cart_outlined, size: 30,),
      'Cart',
      RouterHelper.cart,
    )
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }
}
