import 'package:e_commerce/core/data/user_model.dart';
import 'package:e_commerce/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // var cubit = ProfileCubit.get(context);
        print(sl<UserModel>().name);
        return Scaffold(
          body: ListView(
            children: [
              GreetingWidget(
                userName: sl<UserModel>().name,
                email: sl<UserModel>().email,
              )
            ],
          )
        );
      },
    );
  }
}

