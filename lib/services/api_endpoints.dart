class ApiEndpoints {
  static const String baseUrl = "https://vue-study.skillbox.cc/api";

  static const String accessKey = "$baseUrl/users/accessKey"; //!get
  //*products
  static String productList = "$baseUrl/products?categoryId="; //!get
  static const String product = "$baseUrl/products/{id}"; //!get
  static const String allProducts = "$baseUrl/products?limit="; //!get
  //*Categories
  static const String categoryList = "$baseUrl/productCategories"; //!get
  //*Cart
  static const String cartList = "$baseUrl/baskets?userAccessKey="; //!get
  static const String addToCart = "$baseUrl/baskets/products?userAccessKey="; //!post
  static const String changeNumberOfItemInCart =
      "$baseUrl/baskets/products"; //!put
  static const String removeFromCart = "$baseUrl/baskets/products"; //!delete
}
