class ApiEndpoints {
  static const String baseUrl = "https://vue-study.skillbox.cc/api";

  static const String accessKey = "$baseUrl/users/accessKey"; //!get
  //*products
  static const String productList = "$baseUrl/products"; //!get
  static const String product = "$baseUrl/products/{id}"; //!get
  //*Categories
  static const String categoryList = "$baseUrl/productCategories"; //!get
  //*Cart
  static const String cartList = "$baseUrl/baskets"; //!get
  static const String addToCart = "$baseUrl/baskets/products"; //!post
  static const String changeNumberOfItemInCart =
      "$baseUrl/baskets/products"; //!put
  static const String removeFromCart = "$baseUrl/baskets/products"; //!delete
}
