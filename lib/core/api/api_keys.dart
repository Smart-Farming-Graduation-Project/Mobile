import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  //////////////// errorModel ///////////////////////
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
  static const String address = 'address';
  static const String profileImage = 'profileImage';
  static const String profilePhone = 'phone';
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
  static const String cartItems = 'cartItems';
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
  static String get stripeSecretKey => dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static String get stripePublishableKey {
    // Try to get from environment variable first
    final envKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
    if (envKey != null && envKey.isNotEmpty) {
      return envKey;
    }
    
    // Fallback to a default key (you should replace this with your actual key)
    // In production, you should use build-time configuration
    return 'pk_test_51RghLPQ8ryXlRMVNHHCafXICEe2UIdSJmeUSSew205jxC5Z0wsvKCWtlQrRky3c2elRb8gIrWifiFMNV0p0bmBww00fvJR4803';
  }
}
