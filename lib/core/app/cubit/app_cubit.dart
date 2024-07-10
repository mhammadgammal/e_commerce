import 'package:e_commerce/core/theme/app_images.dart';
import 'package:e_commerce/features/categories/presentation/navigation/category_products_navigation.dart';
import 'package:e_commerce/features/favorite/domain/usecase/change_favorite_usecase.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/categories/domain/usecase/get_categories_usecase.dart';
import '../../../features/categories/presentation/cubit/category_cubit/categories_cubit.dart';
import '../../../features/categories/presentation/screen/category_screen.dart';
import '../../../features/home/domain/usecase/get_ad_usecase.dart';
import '../../../features/home/domain/usecase/get_banners_usecase.dart';
import '../../../features/home/domain/usecase/get_products_usecase.dart';
import '../../di/di.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final searchController = TextEditingController();

  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int _lastIndex = 0;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    categoryProductNavigatorKey,
  ];

  List<(Widget, String, Widget)> screens = [
    (
      const Icon(
        Icons.home,
        size: 30,
      ),
      'Home',
      BlocProvider(
        create: (context) => HomeCubit(
          ChangeFavoriteUsecase(sl.get()),
          GetProductsUsecase(sl.get()),
          GetBannersUsecase(sl.get()),
          GetAdUsecase(sl.get()),
        )..fetch(),
        child: const HomeScreen(),
      )
    ),
    (
      Image.asset(AppImages.categoriesIc, width: 30.0, height: 30.0),
      'Categories',
      BlocProvider(
        create: (_) => CategoriesCubit(
          GetCategoriesUsecase(sl.get()),
        )..getCategories(),
        child: const CategoryScreen(),
      )
    ),
    (
      const Icon(
        Icons.person_2_outlined,
        size: 30,
      ),
      'Profile',
      const Center(
        child: Text('Profile'),
      )
    ),
    (
      const Icon(
        Icons.shopping_cart_outlined,
        size: 30,
      ),
      'Cart',
      const Center(
        child: Text('Profile'),
      )
    ),
  ];

  void changeIndex(int index) {
    print(index);
    if (index != currentIndex) {
      _lastIndex = currentIndex;
      currentIndex = index;

      emit(AppChangeBottomNavState());
    }
  }

  void systemBackButtonPressed() {
    if (_lastIndex != currentIndex) {
      currentIndex = 1;
      emit(DummyState());
    } else {
      emit(ExitApp());
    }
  }
}

/*if (_navigatorKeys[currentIndex].currentState?.canPop() == true) {
      _navigatorKeys[currentIndex]
          .currentState
          ?.pop(_navigatorKeys[currentIndex].currentContext);
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }*/