import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_style.dart';

class AuthenticationBtn extends StatelessWidget {
  const AuthenticationBtn({
    super.key,
    required this.text,
    required this.isLoading,
    required this.authPress,
  });

  final text;
  final void Function() authPress;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          onPressed: authPress,
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(text,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font175WhiteBold),
        ));
  }
}
