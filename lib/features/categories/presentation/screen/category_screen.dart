import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/categories_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return ListView.builder(
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
                  ),
                ));
      },
    );
  }
}
