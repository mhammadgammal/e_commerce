import 'package:e_commerce/core/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_text_style.dart';
import '../widgets/search_field.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        bool isPopping = false;

        final cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: cubit.currentIndex,
            onDestinationSelected: cubit.changeIndex,
            destinations: List.generate(
              cubit.screens.length,
              (index) => NavigationDestination(
                  icon: cubit.screens[index].$1,
                  label: cubit.screens[index].$2),
            ),
          ),
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.screens.map((e) => e.$3).toList(),
            ),
          ),
        );
      },
    );
  }
}

/*            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: cubit.changeIndex,
              backgroundColor: Colors.white,
              elevation: 0.0,
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
            )*/
