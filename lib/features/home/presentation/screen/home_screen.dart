import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/banners_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/recommended_products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
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
              ),
              const SizedBox(
                height: 15.0,
              ),
              RecommendedProducts(
                title: 'Best Selling',
                products: cubit.products,
                onItemPressed: (product) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
