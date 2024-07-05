import 'package:e_commerce/features/home/domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  GetProductsUsecase _getProductsUsecase;
  HomeCubit(
    this._getProductsUsecase,
  ) : super(HomeCubitInitial());

  void fetch() async {
    emit(HomeCubitLoading());
    var result = await _getProductsUsecase.perform();
    print('result: $result');
    emit(HomeCubitLoaded());
  }
}
