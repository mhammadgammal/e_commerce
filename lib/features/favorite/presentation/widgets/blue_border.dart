import 'package:e_commerce/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class BlueBorderWidget extends StatelessWidget {
  const BlueBorderWidget(
      {super.key, required this.borderChild});

  final Widget borderChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.primaryColor,
        )
      ),
      child: borderChild,
    );
  }
}
