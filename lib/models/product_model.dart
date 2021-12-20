// ignore_for_file: unnecessary_new

import 'dart:ui';

class ProductModel {
  int id;
  String title;
  String slug;
  int price;
  Image? image;
  // List<ColorModel> colors;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> responseData) {
    return ProductModel(
        id: responseData['id'],
        title: responseData['title'],
        slug: responseData['slug'],
        price: responseData["price"],
        image: responseData['image'] != null
            ? new Image.fromJson(responseData['image'])
            : null
        // colors: responseData['colors'] != null
        //     ? ColorModel.fromJson(responseData['colors'])
        //     : responseData["colors"]
        );
  }
}
//*image-Model
class Image {
  File? file;

  Image({required this.file});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      file: json['file'] != null ? new File.fromJson(json['file']) : null,
    );
  }
}

class File {
  String url;
  String name;
  String originalName;
  String extension;
  String size;

  File({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
    required this.size,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      url: json['url'],
      name: json['name'],
      originalName: json['originalName'],
      extension: json['extension'],
      size: json['size'],
    );
  }
}

//*Color-Model
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
