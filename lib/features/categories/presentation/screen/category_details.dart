import 'package:e_commerce/features/categories/presentation/cubit/category_product_cubit/category_product_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductCubit, CategoryProductState>(
      builder: (context, state) {
        var cubit = CategoryProductCubit.get(context);
        return Scaffold(
            body: state is CategoryDetailsLoadingState
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.58,
                        children: List.generate(
                          cubit.categoryProducts.length,
                          (index) => ProductCardItem(
                            index: index,
                            product: cubit.categoryProducts[index],
                            onItemPressed: (product) {},
                            onFavPressed: (index, isFavorite) {},
                          ),
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
