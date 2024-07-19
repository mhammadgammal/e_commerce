import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/widgets/no_border_form_field.dart';
import 'package:e_commerce/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/custom_divier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            body: Column(
              children: [
                Container(
                  height: 240.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          NoBorderFormFiled(
                              controller: cubit.emailController,
                              inputType: TextInputType.emailAddress,
                              fieldLabel: 'Email Address',
                              icon: null,
                              isEnabled: false,
                              validate: (value) =>
                                  value == null || value.isEmpty
                                      ? 'You should enter your email'
                                      : !(value.contains('@'))
                                          ? 'Your email should contains \'@\''
                                          : null),
                          const CustomDivier(
                            indent: 0.0,
                          ),
                          NoBorderFormFiled(
                              controller: cubit.firstNameController,
                              inputType: TextInputType.name,
                              fieldLabel: 'First Name',
                              icon: null,
                              suffixIcon: const Icon(Icons.edit),
                              onChanged: cubit.onFirstNameValueChged,
                              validate: (value) =>
                                  value == null || value.isEmpty
                                      ? 'You should enter your name'
                                      : null),
                          const CustomDivier(
                            indent: 0.0,
                          ),
                          NoBorderFormFiled(
                              controller: cubit.lastNameController,
                              inputType: TextInputType.name,
                              fieldLabel: 'Last Name',
                              icon: null,
                              // initialValue: lastName,
                              onChanged: cubit.onLastNameValueChanged,
                              suffixIcon: const Icon(Icons.edit),
                              validate: (value) =>
                                  value == null || value.isEmpty
                                      ? 'You should enter your name'
                                      : null),
                          const CustomDivier(
                            indent: 0.0,
                          ),
                          NoBorderFormFiled(
                              controller: cubit.phoneController,
                              inputType: TextInputType.phone,
                              fieldLabel: 'Phone Number',
                              icon: null,
                              suffixIcon: const Icon(Icons.edit),
                              onChanged: cubit.onPhoneNumberChanged,
                              validate: (value) =>
                                  value == null || value.isEmpty
                                      ? 'You should enter your name'
                                      : null),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: cubit.isModified ? () {} : null,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(cubit.isModified
                          ? AppColors.primaryColor
                          : AppColors.diasabledBtnColor),
                    ),
                    child: const Text(
                      'Save',
                      style: AppTextStyle.font175WhiteNormal,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
