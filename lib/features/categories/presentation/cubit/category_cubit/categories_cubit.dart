import 'package:e_commerce/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/category_entity/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUsecase _categoriesUsecase;
  

  CategoriesCubit(this._categoriesUsecase)
      : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [];
  List<ProductModel> categoryProducts = [];

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    categories = await _categoriesUsecase.perform(null);
    print('categories in cubit $categories');
    emit(CategoriesLoadedSuccessfullyState());
  }

  
}
