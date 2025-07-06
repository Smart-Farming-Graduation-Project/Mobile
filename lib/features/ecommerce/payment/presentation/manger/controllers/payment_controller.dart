import 'package:flutter/material.dart';

class PaymentController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardholderNameController =
      TextEditingController();

  // Getters for form data
  String get cardNumber => cardNumberController.text;
  String get expiryDate => expiryDateController.text;
  String get cvv => cvvController.text;
  String get cardholderName => cardholderNameController.text;

  // Check if form is valid
  bool get isFormValid => formKey.currentState?.validate() ?? false;

  // Get card number without spaces
  String get cardNumberDigits => cardNumber.replaceAll(' ', '');

  // Clear all form fields
  void clearForm() {
    cardNumberController.clear();
    expiryDateController.clear();
    cvvController.clear();
    cardholderNameController.clear();
  }

  // Reset form validation
  void resetValidation() {
    formKey.currentState?.reset();
  }

  // Validate form and return success status
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Get payment data as map
  Map<String, String> getPaymentData() {
    return {
      'cardNumber': cardNumberDigits,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'cardholderName': cardholderName,
    };
  }

  // Dispose all controllers
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardholderNameController.dispose();
  }
}
