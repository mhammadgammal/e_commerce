import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/screen/home_body_loading.dart';
import 'package:e_commerce/features/home/presentation/screen/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return BlocConsumer<HomeCubit, HomeCubitState>(
      listener: (context, state) {
        if (state is RecommendedProductsLoadedSuccessfullyState ||
            state is FavRemotlyToggledState || state is FavoriteProductAddedLocally) {
          HomeCubit.get(context).countFavProducts().then((value) {
            counter = value;
          });
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Salla',
                    style: AppTextStyle.font35BlackBold,
                  ),
                  actions: [
                    // Search Bar
                    SearchField(
                      searchWidth: constraints.maxWidth > 400? constraints.maxWidth * 0.6: constraints.maxWidth * 0.5,
                      searchController: TextEditingController(),
                      onSearchFieldPressed: () {},
                    ),
                    IconButton(
                      onPressed: () =>
                          AppNavigator.navigateToFavorite(context).then((value) {
                        if (value is int && value != -1) {
                          cubit.removeFavProductLocally(value);
                        }
                      }),
                      icon: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          const Icon(
                            Icons.favorite_border,
                            size: 33.0,
                            color: Colors.black,
                          ),
                          Visibility(
                            visible: counter > 0,
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundColor: AppColors.primaryColor,
                              child: Text(
                                counter.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                body: state is HomeCubitLoading
                    ? const HomeBodyLoading()
                    : HomeScreenBody(
                        ads: cubit.ads,
                        banners: cubit.banners,
                        products: cubit.products,
                        onFavPressed: cubit.onFavPressed,
                        onCartPressed: cubit.onCartPressed));
          }
        );
      },
    );
  }
}
