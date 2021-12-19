class ProductModel {
  int id;
  String title;
  String slug;
  int price;
  //  Image image;
  // List<ColorModel> colors;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    // required this.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> responseData) {
    return ProductModel(
      id: responseData['id'],
      title: responseData['title'],
      slug: responseData['slug'],
      price: responseData["price"],
      // colors: responseData['colors'] != null
      //     ? ColorModel.fromJson(responseData['colors'])
      //     : responseData["colors"]
    );
  }
}

//*
class ColorModel {
  int id;
  String title;
  String code;

  ColorModel({
    required this.id,
    required this.title,
    required this.code,
  });

  factory ColorModel.fromJson(Map<String, dynamic> responseData) {
    return ColorModel(
      id: responseData['id'],
      title: responseData['title'],
      code: responseData['code'],
    );
  }
}
