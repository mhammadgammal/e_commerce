import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_category_products.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  final GetCategoryProductsUsecase _getCategoryProductsUseCase;
  CategoryProductCubit(this._getCategoryProductsUseCase)
      : super(CategoryProductInitial());

  static CategoryProductCubit get(context) => BlocProvider.of(context);
  List<ProductModel> categoryProducts = [];

  Future<void> getCategoryProducts(int categoryId) async {
    emit(CategoryDetailsLoadingState());
    try {
      categoryProducts = await _getCategoryProductsUseCase.perform(categoryId);
      print(categoryProducts.length);
      emit(CategoryDetailsSuccessState());
    } catch (e) {
      print(e);
      emit(CategoryDetailsErrorState(e.toString()));
    }
  }
}
