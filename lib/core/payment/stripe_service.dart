import 'dart:developer';

import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

/// Service class for handling Stripe payment operations
/// This class provides methods to create payment intents, initialize payment sheets,
/// and process payments using Stripe's payment infrastructure
class StripeService {
  /// API consumer instance for making HTTP requests to Stripe API
  final Dio dio = Dio();

  /// Creates a payment intent on Stripe's servers
  ///
  /// This method sends a POST request to Stripe's payment_intents endpoint
  /// to create a new payment intent with the provided input data.
  ///
  /// [input] - Contains payment details like amount, currency, etc.
  /// Returns a [PaymentIntentModel] with the created payment intent data
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel input) async {
    final response = await dio.post('https://api.stripe.com/v1/payment_intents',
        data: input.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          },
        ));
    return PaymentIntentModel.fromJson(
      Map<String, dynamic>.from(response.data),
    );
  }

  /// Initializes the Stripe payment sheet with the provided client secret
  ///
  /// This method sets up the payment sheet UI that will be displayed to the user
  /// for collecting payment information. The client secret is required to link
  /// the payment sheet to the specific payment intent.
  ///
  /// [clientSecret] - The client secret from the payment intent, used to identify the payment
  Future<void> initPaymentSheet({required String clientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Crop Guard',
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: AppColors.kPrimaryColor,
            ),
          ),
        ),
      );
    } catch (e) {
      log('Error initializing payment sheet: $e');
      rethrow;
    }
  }

  /// Displays the initialized payment sheet to the user
  ///
  /// This method presents the payment sheet UI where users can enter their
  /// payment information (card details, etc.) to complete the payment.
  ///
  /// Throws an exception if the payment sheet hasn't been initialized or if
  /// the user cancels the payment process.
  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      log('Error presenting payment sheet: $e');
      rethrow;
    }
  }

  /// Complete payment flow that combines all payment steps
  ///
  /// This method orchestrates the entire payment process:
  /// 1. Creates a payment intent on Stripe servers
  /// 2. Initializes the payment sheet with the client secret
  /// 3. Displays the payment sheet to the user
  ///
  /// [input] - Contains all necessary payment information (amount, currency, etc.)
  ///
  /// This is the main method that should be called to process a payment
  Future<void> makePayment({required PaymentIntentInputModel input}) async {
    try {
      // Step 1: Create payment intent on Stripe servers
      var paymentIntent = await createPaymentIntent(input);

      // Step 2: Initialize payment sheet with the client secret
      await initPaymentSheet(clientSecret: paymentIntent.clientSecret!);

      // Step 3: Display payment sheet to user
      await displayPaymentSheet();
    } catch (e) {
      log('Error in makePayment: $e');
      rethrow;
    }
  }
}
