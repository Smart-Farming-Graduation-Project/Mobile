
import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/core/payment/stripe_service.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});

  @override
  Future<Either<FailureModel, void>> makePayment({required PaymentIntentInputModel input}) async {
    try {
      await stripeService.makePayment(input: input);
      return right(null);
    } catch (e) {
      return left(FailureModel(message: e.toString()));
    }
  }
}