import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_text_style.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem(
      {super.key,
      required this.index,
      required this.product,
      required this.onItemPressed,
      required this.onFavPressed,
      required this.onCartPressed});

  final int index;
  final ProductModel product;

  //void Function(ProductModel p1)
  final Function(ProductModel) onItemPressed;

  //void Function(int index, bool isFav)
  final Function(int, bool) onFavPressed;

  final Function(int, bool) onCartPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 183.6,
      child: Card(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 12.0,
            top: 12.0,
            end: 12.0,
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    product.image,
                    width: 163.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 45.0,
                    height: 45.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        // side: const BorderSide(
                        //   width: 35.0,
                        // ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            onFavPressed(index, product.isFavourite),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: SizedBox(
                      width: 45.0,
                      height: 45.0,
                      child: Card(
                        color: Colors.white,
                        elevation: 1.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: IconButton(
                            icon: Icon(
                              product.isCart
                                  ? Icons.shopping_cart_rounded
                                  : Icons.shopping_cart_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              onCartPressed(index, product.isCart);
                              // context.read<CartCubit>().fetchCartItems();
                              // with extensions
                            }),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: 171.6,
                height: 35.0,
                child: Text(
                  product.title,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Text(
                    'EGP ',
                    style: AppTextStyle.font15BlackNormal,
                  ),
                  Text(
                    double.parse(product.price).toInt().toString(),
                    style: AppTextStyle.font15BlackBold,
                  ),
                  Visibility(
                      visible: int.parse(product.discountPercentage) > 0,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            double.parse(product.oldPrice).toInt().toString(),
                            style: AppTextStyle.oldPriceText,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${product.discountPercentage}%',
                            style: AppTextStyle.discount,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
