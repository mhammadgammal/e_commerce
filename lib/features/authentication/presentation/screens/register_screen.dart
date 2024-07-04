import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/continue_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/register_cubit/register_cubit_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 15.0, end: 15.0, top: 65.0),
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
                                controller: cubit.firstNameController,
                                inputType: TextInputType.name,
                                fieldLabel: 'First Name',
                                icon: const Icon(
                                  Icons.person,
                                  color: AppColors.lightGrey,
                                ),
                                validate: cubit.validateFirstName),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DefaultFormFiled(
                                controller: cubit.lastNameController,
                                inputType: TextInputType.name,
                                fieldLabel: 'Last Name',
                                icon: const Icon(
                                  Icons.person,
                                  color: AppColors.lightGrey,
                                ),
                                validate: cubit.validateLastName),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormFiled(
                          controller: cubit.phoneNumberController,
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
                          controller: cubit.emailController,
                          inputType: TextInputType.emailAddress,
                          fieldLabel: 'Email Address',
                          icon: const Icon(
                            Icons.email,
                            color: AppColors.lightGrey,
                          ),
                          validate: cubit.validateEmail),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultFormFiled(
                          controller: cubit.passwordController,
                          inputType: TextInputType.visiblePassword,
                          fieldLabel: 'password',
                          icon: const Icon(
                            Icons.lock,
                            color: AppColors.lightGrey,
                          ),
                          validate: cubit.validatePassword),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            child: const Text('Register',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.font175WhiteBold)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '----------------------------- OR -----------------------------',
                        style: AppTextStyle.font17BlackNormal,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ContinueWithGoogle(false, onTap: () {}),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
      },
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
