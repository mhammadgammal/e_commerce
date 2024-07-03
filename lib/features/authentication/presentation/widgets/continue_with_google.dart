import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle(this.isLoading, {super.key, required this.onTap});
  final bool isLoading;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 2.5
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 25,
                    // Set the desired width of the image.
                    height: 25,
                    // Set the desired height of the image.
                    child: Image.asset(
                      AppImages.googleIc,
                      // Set the desired height of the image.
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    '    Continue with Google',
                    style: AppTextStyle.font17BlackBold,
                  ),
                ],
              ),
      ),
    );
  }
}