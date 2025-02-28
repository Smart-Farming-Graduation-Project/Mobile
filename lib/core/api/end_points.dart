class EndPoints {
  static const String baseUrl = 'https://crop-pilot-api.azurewebsites.net/api/';

  // Authentication
  static const String login = 'Authentication/SignIn';
  static const String register = 'Authentication/Register';
  static const String refreshToken = 'Authentication/RefreshToken';
  static const String revokeToken = 'Authentication/RevokeToken';
  static const String confirmEmail = 'Authentication/confirm-email';
  static const String resendEmail = 'Authentication/resend-email-confirmation-link';
  static const String forgotUsernameOrPassword = 'Authentication/forgot-username-or-password';
  static const String resetPassword = 'Authentication/reset-password';
  static const String changePassword = 'Authentication/ChangePassword';
  static const String forgotUsernameOrPasswordUsingOTP = 'Authentication/forgot-username-or-password-using-OTP';
  static const String resetPasswordUsingOTP = 'Authentication/reset-password-otp';
  static const String registerWithThirdParty = 'Authentication/register-with-third-party';
  static const String loginWithThirdParty = '/Authentication/login-with-third-party';

  //Authorization
  static const String getRoles = 'Authorization/GetRoles';
  static const String getPermissions = 'Authorization/get-permissions';
}

class ApiKeys {
  static const String statusCode = 'statusCode';
  static const String errorMessage = 'message';
  static const String succeeded = 'succeeded';
  static const String data = 'data';
  static const String meta = 'meta';
  static const String email = 'email';
  static const String usernameOrEmail = 'userNameOrEmail';
  static const String username = 'userName';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  static const String provider = 'provider';

}