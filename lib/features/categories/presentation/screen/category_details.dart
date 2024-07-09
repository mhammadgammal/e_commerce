import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:e_commerce/features/categories/presentation/cubit/category_product_cubit/category_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductCubit, CategoryProductState>(
      builder: (context, state) {
        var cubit = CategoryProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () =>
                    Navigator.of(context).pop(), // Use the theme's icon color
              ),
              title: const Text(
                'Salla',
                style: AppTextStyle.font35BlackBold,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40.0),
                child: Container(
                  padding: EdgeInsetsDirectional.only(start: 10.0),
                  width: double.infinity,
                  child: SearchField(
                    searchController: TextEditingController(),
                    onSearchFieldPressed: () {},
                  ),
                ),
              ),
          ),
          body: state is CategoryDetailsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.58,
              children: List.generate(
                cubit.categoryProducts.length,
                    (index) =>
                    ProductCardItem(
                      index: index,
                      product: cubit.categoryProducts[index],
                      onItemPressed: (product) {},
                      onFavPressed: (index, isFavorite) {},
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
