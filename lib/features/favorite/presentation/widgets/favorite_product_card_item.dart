import 'package:e_commerce/features/favorite/presentation/widgets/blue_border.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class FavoriteProductCardItem extends StatelessWidget {
  const FavoriteProductCardItem(
      {super.key, required this.favProduct, required this.showBottomSheet});

  final ProductModel favProduct;
  final void Function(BuildContext, int) showBottomSheet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('Screen Width: ${constraints.maxWidth}');
      print('Screen Height: ${constraints.maxHeight}');
      return Card(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child: Column(
            children: [
              Image.network(
                favProduct.image,
                width: 163.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              //title section
              SizedBox(
                width: 171.6,
                height: 35.0,
                child: Text(
                  favProduct.title,
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
                    double.parse(favProduct.price).toInt().toString(),
                    style: AppTextStyle.font15BlackBold,
                  ),
                  Visibility(
                      visible: int.parse(favProduct.discountPercentage) > 0,
                      child: Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth > 200.0 ? 9.0 : 1.0,
                          ),
                          Text(
                            double.parse(favProduct.oldPrice)
                                .toInt()
                                .toString(),
                            style: AppTextStyle.oldPriceText,
                          ),
                          SizedBox(
                            width: constraints.maxWidth > 200.0 ? 5.0 : 1.0,
                          ),
                          Text(
                            '${favProduct.discountPercentage}%',
                            style: AppTextStyle.discount,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const BlueBorderWidget(
                    borderChild: Text(
                      'View Options',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth > 200.0 ? 9.0 : 5.0,
                  ),
                  BlueBorderWidget(
                    borderChild: GestureDetector(
                      onTap: () =>
                          showBottomSheet(context, int.parse(favProduct.id)),
                      child: const Icon(
                        Icons.more_horiz_outlined,
                        size: 20.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
