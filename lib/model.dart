class CategoryModel {
  final String image;
  final String name;

  CategoryModel({required this.image, required this.name});
}

class ProductModel {
  final String image;
  final String name;
  final String prics;
  final String rate;
  final String countRate;
  int count = 0;

  ProductModel({
    required this.image,
    required this.name,
    required this.prics,
    required this.rate,
    required this.countRate,
  });
}
