import 'package:e_commerce/core/router/app_navigator.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/custom_divier.dart';
import 'package:e_commerce/features/profile/presentation/widgets/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSucessState) {
          AppNavigator.navigateAndFinishToLogin(context);
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
            backgroundColor: AppColors.lightGrey,
            body: cubit.user == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Container(
                    margin: const EdgeInsetsDirectional.only(
                      top: 15.0,
                      start: 10.0,
                      end: 10.0,
                    ),
                    child: ListView(
                      children: [
                        GreetingWidget(
                          userName: cubit.user!.name,
                          email: cubit.user!.email,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 200.0,
                          width: double.infinity,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 20 / 10),
                            itemCount: 4,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsetsDirectional.only(
                                        start: 5.0, end: 3.0),
                                leading: Container(
                                  width: 48.0,
                                  height: 30.0,
                                  margin: const EdgeInsetsDirectional.only(
                                      bottom: 20.0),
                                  child: cubit.profileGroup[index].$1,
                                ),
                                subtitle: Text(
                                  cubit.profileGroup[index].$3,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                                title: Text(
                                  cubit.profileGroup[index].$2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'My Account',
                          style: AppTextStyle.font17BlackBold,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        // account section
                        Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListView.separated(
                              itemBuilder: (context, index) => ListTile(
                                    leading: cubit.myAccountSection[index].$1,
                                    title:
                                        Text(cubit.myAccountSection[index].$2),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const CustomDivier(
                                    height: 2.0,
                                    indent: 20.0,
                                    color: Colors.grey,
                                  ),
                              itemCount: cubit.myAccountSection.length),
                        ),
                        const SizedBox(height: 20.0),
                        // settings section
                        const Text(
                          'Settings',
                          style: AppTextStyle.font17BlackBold,
                        ),
                        Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListView.separated(
                              itemBuilder: (context, index) => ListTile(
                                    leading: cubit.settingsSection[index].$1,
                                    title:
                                        Text(cubit.settingsSection[index].$2),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const CustomDivier(),
                              itemCount: cubit.settingsSection.length),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        const CustomDivier(
                          indent: 140.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: () => cubit.logout(),
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.power_settings_new_outlined,
                                size: 22.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                'Sign Out',
                                style: AppTextStyle.font16BlackNormal,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
      },
    );
  }
}
