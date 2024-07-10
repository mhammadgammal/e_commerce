import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('cart: ${cubit.cartItems.length}'),
            actions: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: 15.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    Text(
                      ' Wishlist ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.grey, size: 20.0)
                  ],
                ),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: cubit.cartItems.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Image.network(
                          cubit.cartItems[index].product.image,
                          width: 163.0,
                          height: 150.0,
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              cubit.cartItems[index].product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'EGP ',
                                  style: AppTextStyle.font15BlackNormal,
                                ),
                                Text(
                                  double.parse(
                                          cubit.cartItems[index].product.price)
                                      .toInt()
                                      .toString(),
                                  style: AppTextStyle.font15BlackBold,
                                ),
                                Visibility(
                                    visible: int.parse(cubit.cartItems[index]
                                            .product.discountPercentage) >
                                        0,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          double.parse(cubit.cartItems[index]
                                                  .product.oldPrice)
                                              .toInt()
                                              .toString(),
                                          style: AppTextStyle.oldPriceText,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          '${cubit.cartItems[index].product.discountPercentage}%',
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
                        ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,
                      ),
                      child: GestureDetector(
                        onTap: () => cubit.onQuantityExpanded(index),
                        child: Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    cubit.cartItems[index].quantity.toString(),
                                    style: const TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon((cubit.isExpanded && cubit.expandedQuantityItem == index)
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: GestureDetector(
                                  onTap: () => cubit.removeCartItem(cubit.cartItems[index].product.id),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.grey,
                                      ),
                                      Text('Remove  '),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              width: 90.0,
                            ),
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                                  Text('Move To Wishlist  '),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (cubit.isExpanded && cubit.expandedQuantityItem == index),
                      child: Container(
                        height: 30.0,
                        padding: const EdgeInsetsDirectional.only(start: 20.0),
                        margin: const EdgeInsetsDirectional.only(top: 10.0),
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, quantityIndex) =>
                              GestureDetector(
                            onTap: () => cubit.selectQuantityFromExpanded(
                                quantityIndex, index),
                            child: Container(
                              width: 50.0,
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsetsDirectional.only(end: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: cubit.cartItems[index].quantity ==
                                          (quantityIndex + 1)
                                      ? AppColors.primaryColor
                                      : Colors.grey,
                                ),
                              ),
                              child: Text('${quantityIndex + 1}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
