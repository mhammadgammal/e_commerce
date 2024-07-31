import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key,
      required this.oldPrice,
      required this.price,
      required this.discount});

  final String oldPrice;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(
        'EGP ',
        style: AppTextStyle.font15BlackNormal,
      ),
      Text(
        double.parse(price).toInt().toString(),
        style: AppTextStyle.font15BlackBold,
      ),
      Visibility(
          visible: int.parse(discount) > 0,
          child: Row(
            children: [
              const SizedBox(
                width: 5.0,
              ),
              Text(
                double.parse(oldPrice).toInt().toString(),
                style: AppTextStyle.oldPriceText,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                '$discount%',
                style: AppTextStyle.discount,
              ),
            ],
          ))
    ]);
  }
}
