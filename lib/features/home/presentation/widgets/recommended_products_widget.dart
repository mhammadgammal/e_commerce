import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/product_entity/product_model.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts(
      {super.key,
      required this.title,
      required this.products,
      required this.onItemPressed,
      required this.onFavPressed,required this.onCartPressed});

  final String title;
  final List<ProductModel> products;
  final void Function(ProductModel) onItemPressed;
  final void Function(bool isFav, {int index, String id}) onFavPressed;
  final void Function(int, bool) onCartPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(
        10.0,
      ),
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.font20BlackBold,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => AppNavigator.navigateToProductDetails(context, (index, products[index])),
                  child: ProductCardItem(
                    index: index,
                    product: products[index],
                    onItemPressed: onItemPressed,
                    onFavPressed: onFavPressed,
                    onCartPressed: onCartPressed,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
