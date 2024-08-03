class ProductModel {
  String id;
  String price;
  String oldPrice;
  String discountPercentage;
  String title;
  String image;
  List<String> images;
  String description;
  bool isFavourite;
  bool isCart;

  ProductModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discountPercentage,
      required this.title,
      required this.image,
      required this.description,
      required this.images,
      this.isFavourite = false,
      this.isCart = false});

  factory ProductModel.fromJson(Map<String, dynamic> productsResponse) =>
      ProductModel(
          id: productsResponse['id'].toString(),
          price: productsResponse['price'].toString(),
          oldPrice: productsResponse['old_price'].toString(),
          discountPercentage: productsResponse['discount'].toString(),
          title: productsResponse['name'] ?? '',
          image: productsResponse['image'],
          images: productsResponse['images'] == null
              ? []
              : List.generate(productsResponse['images'].length,
                  (index) => productsResponse['images'][index] as String),
          description: productsResponse['description'],
          isFavourite: productsResponse['in_favorites'] ?? true,
          isCart: productsResponse['in_cart'] ?? false);
}
