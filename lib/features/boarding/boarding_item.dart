import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/utils/localization/app_localization.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(height: 30),
        Text(AppLocalizations.of(context).translate(title),
            style: AppTextStyle.font35BlackBold),
        const SizedBox(height: 15),
        Text(subtitle,
            style: AppTextStyle.font16BlackNormal, textAlign: TextAlign.center),
      ],
    );
  }
}
