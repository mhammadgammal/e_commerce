import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/product_entity/product_model.dart';

class CategorySection extends StatelessWidget {
  const CategorySection(
      {super.key,
      required this.title,
      required this.products,
      required this.onItemPressed});

  final String title;
  final List<ProductModel> products;
  final void Function(ProductModel) onItemPressed;
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
                                products[index].image,
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
                                      products[index].isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
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
                                        products[index].isCart
                                            ? Icons.shopping_cart_rounded
                                            : Icons.shopping_cart_outlined,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            height: 35.0,
                            width: 171.6,
                            child: Text(
                              products[index].title,
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
                                double.parse(products[index].price)
                                    .toInt()
                                    .toString(),
                                style: AppTextStyle.font15BlackBold,
                              ),
                              Visibility(
                                  visible: int.parse(
                                          products[index].discountPercentage) >
                                      0,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        double.parse(products[index].oldPrice)
                                            .toInt()
                                            .toString(),
                                        style: AppTextStyle.oldPriceText,
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '${products[index].discountPercentage}%',
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
