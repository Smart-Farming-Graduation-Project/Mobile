import 'package:crop_guard/featurs/cart/views/google_map/confirm_delivery_location_view_body.dart';
import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmDeliveryLocationView extends StatelessWidget {
  const ConfirmDeliveryLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(),
      child: const ConfirmDeliveryLocationViewBody(),
    );
  }
}
