bool validatePaymentData({
    required String cardNumber,
    required String expiryDate,
    required String cvv,
    required String cardholderName,
  }) {
    if (cardNumber.replaceAll(' ', '').length != 16) return false;
    if (expiryDate.length != 5) return false;
    if (cvv.length != 3) return false;
    if (cardholderName.trim().isEmpty) return false;

    return true;
  }