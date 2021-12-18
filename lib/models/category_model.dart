class CategoryModel {
  int id;
  String title;
  String slug;

  CategoryModel({
    required this.id,
    required this.title,
    required this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> responseData) {
    return CategoryModel(
      id: responseData['id'],
      title: responseData['title'],
      slug: responseData['slug'],
    );
  }
}
