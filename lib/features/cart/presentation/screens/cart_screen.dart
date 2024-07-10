import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return const Placeholder();
            });
      },
    );
  }
}
