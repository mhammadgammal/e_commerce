import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/router_helper.dart';
import '../../../../core/theme/app_text_style.dart';
import '../cubit/category_cubit/categories_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Salla',
                  style: AppTextStyle.font35BlackBold,
                ),
                actions: [
                  // Search Bar
                  SearchField(
                    searchWidth: constraints.maxWidth > 400? constraints.maxWidth * 0.7: constraints.maxWidth * 0.6,
                    searchController: TextEditingController(),
                    onSearchFieldPressed: () {},
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: cubit.categories.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) => Card(
                        elevation: 1.5,
                        child: ListTile(
                          leading: Image.network(cubit.categories[index].image,
                              fit: BoxFit.cover, width: 50, height: 50),
                          title: Text(cubit.categories[index].name),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.pushNamed(
                              context, RouterHelper.categoriesDetail,
                              arguments: cubit.categories[index].id),
                        ),
                      )),
            );
          }
        );
      },
    ); //context, cubit.categories[index].id
  }
}
