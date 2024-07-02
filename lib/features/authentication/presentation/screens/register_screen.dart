import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/continue_with_google.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 65.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                ' Register',
                style: AppTextStyle.font30BlackBold,
              ),
              const Text('  Ready! to start your shopping journey...',
                  style: AppTextStyle.font15BlackNormal),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultFormFiled(
                        controller: TextEditingController(),
                        inputType: TextInputType.name,
                        fieldLabel: 'First Name',
                        icon: const Icon(
                          Icons.person,
                          color: AppColors.lightGrey,
                        ),
                        validate: (name) => name == null || name.isEmpty
                            ? 'Please enter your first name'
                            : null),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefaultFormFiled(
                        controller: TextEditingController(),
                        inputType: TextInputType.name,
                        fieldLabel: 'Last Name',
                        icon: const Icon(
                          Icons.person,
                          color: AppColors.lightGrey,
                        ),
                        validate: (name) => name == null || name.isEmpty
                            ? 'Please enter your last name'
                            : null),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultFormFiled(
                  controller: TextEditingController(),
                  inputType: TextInputType.phone,
                  fieldLabel: 'Phone Number',
                  icon: const Icon(
                    Icons.phone,
                    color: AppColors.lightGrey,
                  ),
                  validate: (phone) => null),
              const SizedBox(
                height: 20,
              ),
              DefaultFormFiled(
                  controller: TextEditingController(),
                  inputType: TextInputType.emailAddress,
                  fieldLabel: 'Email Address',
                  icon: const Icon(
                    Icons.email,
                    color: AppColors.lightGrey,
                  ),
                  validate: (email) => email == null || email.isEmpty
                      ? 'Please enter your email address'
                      : !(email.contains('@'))
                          ? 'Please enter @ to be valid email address'
                          : null),
              const SizedBox(
                height: 20,
              ),
              DefaultFormFiled(
                  controller: TextEditingController(),
                  inputType: TextInputType.visiblePassword,
                  fieldLabel: 'password',
                  icon: const Icon(
                    Icons.lock,
                    color: AppColors.lightGrey,
                  ),
                  validate: (email) => email == null || email.length < 8
                      ? 'Please enter at least 8 characters to be valid password'
                      : null),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45.0,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: const Text('Register',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.font15WhiteBold)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '----------------------------- OR -----------------------------',
                style: AppTextStyle.font17White,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ContinueWithGoogle(false, onTap: () {}),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Already have an account?',
                      style: AppTextStyle.font15BlackNormal),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.googleIc,
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Continue with Google',
                      style: AppTextStyle.font15BlackNormal),
                ],
              ), */
}
