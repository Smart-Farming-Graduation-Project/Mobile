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
}

class ApiKeys {
  ////////////// errorModel ///////////////////////
  static const String statusCode = 'statusCode';
  static const String errorMessage = 'message';
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
  /////////////////////////Authorization  ///////////////////////////////
  static const String authorization = 'Authorization';
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



}
