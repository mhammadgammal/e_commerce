part of 'category_product_cubit.dart';

@immutable
sealed class CategoryProductState {}

final class CategoryProductInitial extends CategoryProductState {}
final class CategoryDetailsErrorState extends CategoryProductState {
  final String error;
  CategoryDetailsErrorState(this.error);
}
final class CategoryDetailsLoadingState extends CategoryProductState {}

final class CategoryDetailsSuccessState extends CategoryProductState {}

