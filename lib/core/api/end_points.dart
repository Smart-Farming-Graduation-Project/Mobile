class EndPoints {
  static const String baseUrl = 'https://crop-pilot-api.azurewebsites.net/api/';

  // Authentication
  static const String login = 'Authentication/SignIn';
  static const String register = 'Authentication/Register';
  static const String refreshToken = 'Authentication/RefreshToken';
  static const String revokeToken = 'Authentication/RevokeToken';
  static const String confirmEmail = 'Authentication/confirm-email';
  static const String resendEmail =
      'Authentication/resend-email-confirmation-link';
  static const String forgotUsernameOrPassword =
      'Authentication/forgot-username-or-password';
  static const String resetPassword = 'Authentication/reset-password';
  static const String changePassword = 'Authentication/ChangePassword';
  static const String forgotUsernameOrPasswordUsingOTP =
      'Authentication/forgot-username-or-password-using-OTP';
  static const String resetPasswordUsingOTP =
      'Authentication/reset-password-otp';
  static const String registerWithThirdParty =
      'Authentication/register-with-third-party';
  static const String loginWithThirdParty =
      '/Authentication/login-with-third-party';
      static const String checkEmailAndUsername = 'User/IsValidUserNameAndEmail';

  //Authorization
  static const String getRoles = 'Authorization/GetRoles';
  static const String getPermissions = 'Authorization/get-permissions';

  // Cart
  static const String getCart = 'Cart/GetCart';
  static String addToCart(int id){
      return 'Cart/AddProduct/$id';
  }
  static String removeFromCart(int id){
    return 'Cart/RemoveProduct/$id';
  }

  // Categories
  static const String getCategories = 'Category/CategoryList';
  static String getCategoryProducts(String id) {
    return 'Category/Category/$id';
  }

  // Favorites
  static const String getFavorites = 'Wishlist/GetWishlist';
  static String addToFavorites(int id) {
    return 'Wishlist/AddProduct/$id';
  }
  static String removeFromFavorites(int id) {
    return 'Wishlist/RemoveProduct/$id';
  }

  // Products
  static const String getProducts = 'Product/ProductList';
  static String getProductDetails(String id) {
    return 'Product/product/$id';
  }
}
