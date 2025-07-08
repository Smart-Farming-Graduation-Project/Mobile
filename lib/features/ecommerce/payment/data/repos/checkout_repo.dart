import 'package:crop_guard/core/failure/failure_model.dart';
import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<FailureModel, void>> makePayment({required PaymentIntentInputModel input});
}