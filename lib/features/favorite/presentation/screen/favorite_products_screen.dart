import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorite_products_cubit.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
      builder: (context, state) {
        return Placeholder();
      },
    );
  }
}
