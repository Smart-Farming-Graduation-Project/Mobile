import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_cubit.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmDeliveryLocationViewBody extends StatelessWidget {
  const ConfirmDeliveryLocationViewBody(
      {super.key, required this.position, required this.address});
  final LatLng position;
  final String address;
  @override
  Widget build(BuildContext context) {
    final locationMarker = Marker(
      markerId: const MarkerId('myLocation'),
      position: position,
      infoWindow: const InfoWindow(title: 'My Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: context.read<LocationCubit>().onMapCreated,
          initialCameraPosition: CameraPosition(
            target: position,
            zoom: 17,
          ),
        
          markers: {locationMarker},
        ),
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: SearchBarFilter(isGoogleMap: true),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            shape: const CircleBorder(),
            onPressed: () {
              context.read<LocationCubit>().updateLocation();
            },
            child: const Icon(Icons.my_location_rounded, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
