class PaymentValidators {
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your card number';
    }
    final digitsOnly = value.replaceAll(' ', '');
    if (digitsOnly.length < 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter expiry date';
    }
    if (value.length < 5) {
      return 'Invalid format';
    }

    final month = int.tryParse(value.substring(0, 2));
    if (month == null || month < 1 || month > 12) {
      return 'Invalid month';
    }

    final currentYear = DateTime.now().year % 100;
    final year = int.tryParse(value.substring(3, 5));
    if (year == null || year < currentYear) {
      return 'Card expired';
    }
    if (year == currentYear && month < DateTime.now().month) {
      return 'Card expired';
    }
    return null;
  }

  static String? validateCvv(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter CVV';
    }
    if (value.length != 3) {
      return 'CVV must be 3 digits';
    }
    return null;
  }

  static String? validateCardholderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter cardholder name';
    }
    return null;
  }
}
