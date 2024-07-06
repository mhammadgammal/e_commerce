import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/banners_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/categiry_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
              style: AppTextStyle.font35BlackBold,
            ),
            actions: [
              // Search Bar
              SearchField(
                searchController: cubit.searchController,
                onSearchFieldPressed: () {},
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 15.0,
              ),
              BannersWidget(banners: cubit.banners),
              const SizedBox(
                height: 15.0,
              ),
              CategorySection(
                title: 'Recommended For You',
                products: cubit.products,
                onItemPressed: (product) {},
              )
            ],
          ),
        );
      },
    );
  }
}
