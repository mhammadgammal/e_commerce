import 'package:e_commerce/features/cart/domain/entity/cart_product_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> cartItemsCounter = ValueNotifier(0);
ValueNotifier<List<CartProductModel>> cartItemsNotifier = ValueNotifier([]);