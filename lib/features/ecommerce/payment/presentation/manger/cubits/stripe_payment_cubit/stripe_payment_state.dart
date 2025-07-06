class StripePaymentState {}

class StripePaymentInitial extends StripePaymentState {}

class StripePaymentLoading extends StripePaymentState {}

class StripePaymentSuccess extends StripePaymentState {}

class StripePaymentFailure extends StripePaymentState {
  final String message;

  StripePaymentFailure({required this.message});
}