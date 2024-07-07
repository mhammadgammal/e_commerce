import 'package:e_commerce/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/category_entity/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUsecase _categoriesUsecase;
  CategoriesCubit(this._categoriesUsecase) : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [];

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    categories = await _categoriesUsecase.perform();
    print('categories in cubit $categories');
    emit(CategoriesLoadedSuccessfullyState());
  }
}
