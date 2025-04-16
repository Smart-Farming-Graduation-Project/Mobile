import 'package:crop_guard/featurs/cart/views/google_map/confirm_delivery_location_view_body.dart';
import 'package:crop_guard/featurs/cart/views/google_map/helper/build_app_bar.dart';
import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_cubit.dart';
import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmDeliveryLocationView extends StatelessWidget {
  const ConfirmDeliveryLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocProvider(
        create: (context) => LocationCubit()..getCurrentLocation(),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationLoaded) {
              return ConfirmDeliveryLocationViewBody(
                position: state.position,
                address: state.address,
              );
            } else if (state is LocationUpdated) {
              return ConfirmDeliveryLocationViewBody(
                position: state.position,
                address: state.address,
              );
            } else if (state is LocationError) {
              return const Center(child: Text('Failed to get location'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
