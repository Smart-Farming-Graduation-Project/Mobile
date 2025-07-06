class EndPoints {
  static const String baseUrl = 'https://crop-pilot-api.azurewebsites.net/api/';

  static const String basePosts = "https://crop-pilot-api.azurewebsites.net/api/Posts";

  static const String getAllPosts = "$basePosts/GetPosts";
  static String getPostById(int id) => "$basePosts/GetPost/$id";
  static String getPostsByUser(String userId) => "$basePosts/GetPostsByUser/$userId";
  static const String createPost = "$basePosts/CreatePost";
  static String updatePost(int id) => "$basePosts/UpdatePost/$id";
  static String deletePost(int id) => "$basePosts/DeletePost/$id";


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
  static String addToCart(int id) {
    return 'Cart/AddProduct/$id';
  }

  static String removeFromCart(int id) {
    return 'Cart/RemoveProduct/$id';
  }
  // Votes
  static const String vote = '$baseUrl/api/Votes/Vote';
  static const String deleteVote = '$baseUrl/api/Votes/DeleteVote';

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
  static const String getProducts = 'Product/ProductsList';
  static String getProductDetails(String id) {
    return 'Product/product/$id';
  }

  static const String getMyProducts = 'Product/ProductsByUserId';
  static const String addProduct = 'Product/Product/Create';
  static const String updateProduct = 'Product/Product/Update';
  static String deleteMyProduct(int productId) {
    return 'Product/ProductDelete/$productId';
  }

  // Reviews
  static String getReviews(String productId) {
    return 'Reviews/GetReviews/$productId';
  }

  static const String addReview = 'Reviews/CreateReview';

  // ChatBot
  static const String chat = 'ChatBot/Chat';
  static const String getChatHistory = 'ChatBot/ChatHistory';

  // Pest Detection
  static const String pestDetectionImage = 'AIModel/predict';
  static String pestDetectionImageInfo(String imageId) {
    return 'AIModel/feedback/$imageId';
  }

  // Soil Info
  static const String soilChartData = 'IoT/latest-reading';
  static const String soilAnalysisData = 'IoT/Get-Last-Reading';
}

