import 'package:crop_guard/features/ecommerce/payment/data/models/payment_intent_input_model.dart';
import 'package:crop_guard/features/ecommerce/payment/data/repos/checkout_repo.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/controllers/payment_controller.dart';
import 'package:crop_guard/features/ecommerce/payment/presentation/manger/cubits/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckoutRepo checkoutRepo;
  final PaymentController paymentController = PaymentController();

  StripePaymentCubit({required this.checkoutRepo}) : super(StripePaymentInitial());

  Future<void> makePayment({required PaymentIntentInputModel input}) async {
    emit(StripePaymentLoading());
    final result = await checkoutRepo.makePayment(input: input);
    result.fold(
      (failure) => emit(StripePaymentFailure(message: failure.message)),
      (success) => emit(StripePaymentSuccess()),
    );
  }
}
