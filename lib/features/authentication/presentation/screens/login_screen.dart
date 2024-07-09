import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/widgets/default_form_field.dart';
import 'package:e_commerce/features/authentication/presentation/view_model/login_cubit/login_cubit_cubit.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/authentication_btn.dart';
import 'package:e_commerce/features/authentication/presentation/widgets/continue_with_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          AppNavigator.navigateTtoToLayout(context);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubitCubit.get(context);
        return Scaffold(
          body: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 15.0, end: 15.0, top: 65.0),
                child: Form(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: AppTextStyle.font35BlackBold,
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Welcome Back to the app!',
                        style: AppTextStyle.font17GreyNormal,
                      ),
                      const SizedBox(height: 50.0),
                      DefaultFormFiled(
                          controller: cubit.emailController,
                          inputType: TextInputType.emailAddress,
                          fieldLabel: 'Email Address',
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          validate: cubit.validateEmail),
                      const SizedBox(height: 25.0),
                      DefaultFormFiled(
                          controller: cubit.passwordController,
                          inputType: TextInputType.visiblePassword,
                          fieldLabel: 'Password',
                          icon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          obSecure: cubit.obscureText,
                          suffixIcon: IconButton(
                              onPressed: () => cubit.changePasswordVisibility(),
                              icon: Icon(
                                cubit.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.lightGrey,
                              )),
                          maxLines: 1,
                          validate: cubit.validatePassword),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: AppColors.primaryColor),
                          )),
                      const SizedBox(height: 35.0),
                      AuthenticationBtn(
                          isLoading: state is LoginLoadingState ? true : false,
                          text: 'Login',
                          authPress: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          }),
                      const SizedBox(
                        height: 35.0,
                      ),
                      const Text(
                        ' ---------------------------------- OR ----------------------------------',
                        style: AppTextStyle.font17BlackNormal,
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      ContinueWithGoogle(false,
                          onTap: () => cubit.loginWithGoogle()),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () =>
                                AppNavigator.navigateToRegister(context),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              )),
        );
      },
    );
  }
}
