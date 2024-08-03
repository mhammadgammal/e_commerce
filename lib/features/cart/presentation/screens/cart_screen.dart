import 'package:e_commerce/core/utils/screen_utils.dart';
import 'package:e_commerce/core/widgets/auth_error_dialogue.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/notifiers/notifiers.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../domain/entity/cart_product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemsLoadingState) {
          const AlertDialog(
            content: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }

        if (state is CartItemMovedToWislistFailureState) {
          showDialog(
              context: context,
              builder: (_) => AuthErrorDialogue(
                    errorMessage: state.e,
                  ));
        }
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        var width = ScreenUtils.getScreenWidth(context);
        return Scaffold(
          appBar: AppBar(
            title: ValueListenableBuilder(
                valueListenable: cartItemsCounter,
                builder: (BuildContext context, int counterValue, _) {
                  print('cart items count: $counterValue');
                  return Text("Cart:$counterValue");
                }),
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
          body: ValueListenableBuilder(
              valueListenable: cartItemsNotifier,
              builder:
                  (BuildContext context, List<CartProductModel> cartItems, _) {
                print('cart items count in builder: $cartItems');
                return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      print(
                          'cart items count in cart list view: ${cartItems.length}');
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Image.network(
                                cartItems[index].product.image,
                                width: 163.0,
                                height: 150.0,
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      cartItems[index].product.title,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'EGP ',
                                        style: AppTextStyle.font15BlackNormal,
                                      ),
                                      Text(
                                        double.parse(
                                                cartItems[index].product.price)
                                            .toInt()
                                            .toString(),
                                        style: AppTextStyle.font15BlackBold,
                                      ),
                                      Visibility(
                                          visible: int.parse(cartItems[index]
                                                  .product
                                                  .discountPercentage) >
                                              0,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                double.parse(cartItems[index]
                                                        .product
                                                        .oldPrice)
                                                    .toInt()
                                                    .toString(),
                                                style:
                                                    AppTextStyle.oldPriceText,
                                              ),
                                              const SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                '${cartItems[index].product.discountPercentage}%',
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
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => cubit.onQuantityExpanded(index),
                                  child: Container(
                                    width: 50.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          cartItems[index].quantity.toString(),
                                          style:
                                              const TextStyle(fontSize: 20.0),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon((cubit.isExpanded &&
                                                cubit.expandedQuantityItem ==
                                                    index)
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down),
                                      ],
                                    ),
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
                                      onTap: () => cubit.removeCartItem(
                                          cartItems[index].product.id),
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
                                SizedBox(
                                  width:
                                      width > 400 ? width * 0.28 : width * 0.13,
                                ),
                                GestureDetector(
                                  //onTap: () => cubit.onQuantityExpanded(index),
                                  onTap: () => cubit.moveToWishlistPressed(
                                      cartItems[index].product.id),
                                  child: Container(
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
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: (cubit.isExpanded &&
                                cubit.expandedQuantityItem == index),
                            child: Container(
                              height: 30.0,
                              padding:
                                  const EdgeInsetsDirectional.only(start: 20.0),
                              margin:
                                  const EdgeInsetsDirectional.only(top: 10.0),
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
                                    margin: const EdgeInsetsDirectional.only(
                                        end: 10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: cartItems[index].quantity ==
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
                    });
              }),
        );
      },
    );
  }
}
