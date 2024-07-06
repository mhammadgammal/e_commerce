import 'package:e_commerce/core/app/cubit/app_cubit.dart';
import 'package:e_commerce/core/app/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_text_style.dart';
import '../widgets/search_field.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
              style: AppTextStyle.font35BlackBold,
            ),
            actions: [
              // Search Bar
              SearchField(
                searchController: cubit.searchController,
                onSearchFieldPressed: () {},
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.changeIndex,
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
            selectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
            items: List.generate(
              cubit.screens.length,
              (index) => BottomNavigationBarItem(
                icon: cubit.screens[index].$1,
                label: cubit.screens[index].$2,
              ),
            ),
          ),
          body: ScreenView(
            cubit.screens[cubit.currentIndex].$3,
          ),
        );
      },
    );
  }
}
