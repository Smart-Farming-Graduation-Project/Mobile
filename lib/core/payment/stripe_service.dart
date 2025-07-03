import 'package:crop_guard/core/api/api_keys.dart';
import 'package:crop_guard/core/api/multi_base_api_consumer.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
 final MultiBaseApiConsumer api;

  StripeService({required this.api});

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel input) async {
    final response = await api.post(
      'https://api.stripe.com/v1/payment_intents',
      data: input.toJson(),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
      },
    );
    return PaymentIntentModel.fromJson(response);
  }
}