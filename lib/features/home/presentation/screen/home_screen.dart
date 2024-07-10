import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/banners_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';
import '../widgets/recommended_products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return BlocConsumer<HomeCubit, HomeCubitState>(
      listener: (context, state) {
        if (state is RecommendedProductsLoadedSuccessfullyState) {
          HomeCubit.get(context).countFavProducts().then((value) {
            counter = value;
          });
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
              style: AppTextStyle.font35BlackBold,
            ),
            actions: [
              // Search Bar
              SearchField(
                searchWidth: 230.0,
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
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(
                height: 15.0,
              ),
              BannersWidget(banners: cubit.banners),
              const SizedBox(
                height: 15.0,
              ),
              RecommendedProducts(
                title: 'Recommended For You',
                products: cubit.products,
                onItemPressed: (product) {},
                onFavPressed: cubit.onFavPressed,
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
