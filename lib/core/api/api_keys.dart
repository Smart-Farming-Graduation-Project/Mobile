class ApiKeys {
  ////////////// errorModel ///////////////////////
  static const String statusCode = 'statusCode';
  static const String message = 'message';
  static const String succeeded = 'succeeded';
  static const String data = 'data';
  static const String meta = 'meta';
  ////////////////////// Authentication //////////////////////
  static const String email = 'email';
  static const String usernameOrEmail = 'userNameOrEmail';
  static const String username = 'userName';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String phoneNumber = 'phone';
  static const String image = 'Image ';
  static const String role = 'role';
  /////////////////////////Authorization  ///////////////////////////////
  static const String authorization = 'Authorization';
  static const String userId = 'userId';
  ///////////////////////// Authentication response ////////////////////////
  static const String tokens = 'tokens';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String provider = 'provider';
  static const String code = 'code';
  ////////////////////// resetPassword  ////////////////////////
  static const String token = 'token';
  static const String newPassword = 'newPassword';
  //////////////////////// Cart ////////////////////////
  static const String quantity = 'quantity';

  ///////////////////////// Category ////////////////////////
  static const String categoryId = 'categoryId';
  static const String categoryName = 'categoryName';

  /////////////////////// Product ////////////////////////
  static const String products = 'products';
  static const String productId = 'productId';
  static const String productName = 'productName';
  static const String productImages = 'images';
  static const String productPrice = 'price';
  static const String productDescription = 'description';
  static const String productIsFavorite = 'is_favorite';
  static const String productAvailability = 'availability';
  static const String productRating = 'averageRating';
  static const String isFavorite = 'isFavorite';
  static const String sellerName = 'productOwner';
  ///////////////// favorite ////////////////////////
  static const String favoriteProducts = 'wishlistItems';

  /////////////////////// ChatBot ////////////////////////
  static const String prompt = 'prompt';

  /////////////////////// Stripe ////////////////////////
  static const String stripeSecretKey = 'stripeSecretKey';
}
