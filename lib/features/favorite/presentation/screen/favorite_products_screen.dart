import 'package:e_commerce/features/favorite/presentation/widgets/favorite_product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';
import '../cubit/favorite_products_cubit.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteProductsCubit, FavoriteProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FavoriteProductsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context, cubit.productId),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              'Salla',
              style: AppTextStyle.font35BlackBold,
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(15.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.45,
                children: List.generate(
                  cubit.favoriteProducts.length,
                  (index) => FavoriteProductCardItem(
                    favProduct: cubit.favoriteProducts[index],
                    showBottomSheet: cubit.showBottomSheet,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
