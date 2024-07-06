import 'category_model.dart';

class CategoryResponse {
  bool status;
  String? message;
  List<CategoryModel> categories;

  CategoryResponse({required this.status, required this.message, required this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    status: json["status"],
    message: json["message"],
    categories: List<CategoryModel>.from(json["data"]['data'].map((x) => CategoryModel.fromJson(x))),
  );
}
