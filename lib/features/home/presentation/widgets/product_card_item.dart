import 'package:e_commerce/core/notifiers/notifiers.dart';
import 'package:e_commerce/core/utils/screen_utils.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:e_commerce/features/home/presentation/widgets/price_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/wish_list_icon_widget.dart';
import 'package:flutter/material.dart';

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
  final Function(bool isFav, {int index, String id}) onFavPressed;

  final Function(int, bool) onCartPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtils.getScreenWidth(context) * 0.52,
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
                  WishListIcon(
                    index: index,
                    isFavourite: product.isFavourite,
                    onFavPressed: onFavPressed,
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
                        child: ValueListenableBuilder(
                            valueListenable: cartItemsId,
                            builder: (context, cartItems, _) {
                              return IconButton(
                                  icon: Icon(
                                    cartItems[product.id] == true
                                        ? Icons.shopping_cart_rounded
                                        : Icons.shopping_cart_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () =>
                                      onCartPressed(index, product.isCart));
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
                width: double.infinity,
                height: 35.0,
                child: Expanded(
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
              ),
              const SizedBox(
                height: 5.0,
              ),
              PriceWidget(
                  oldPrice: product.oldPrice,
                  price: product.oldPrice,
                  discount: product.discountPercentage),
              const SizedBox(
                width: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
