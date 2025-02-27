String? isValidPassword(String value) {
  if (value.length < 8) {
                return "Password must be at least 8 characters long.";
              }
              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return "Password must contain at least one uppercase letter.";
              }
              if (!RegExp(r'\d').hasMatch(value)) {
                return "Password must contain at least one number.";
              }
              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                return "Password must contain at least one special character.";
              }
              return null;  
}