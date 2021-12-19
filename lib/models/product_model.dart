class ProductModel {
  int id;
  String title;
  String slug;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
  });

  factory ProductModel.fromJson(Map<String, dynamic> responseData) {
    return ProductModel(
      id: responseData['id'],
      title: responseData['title'],
      slug: responseData['slug'],
    );
  }
}
