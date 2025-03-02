import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_cubit.dart';
import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_state.dart';
import 'package:crop_guard/featurs/home/presentation/views/widgets/search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmDeliveryLocationViewBody extends StatelessWidget {
  const ConfirmDeliveryLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Confirm Delivery Location'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LocationCubit()..getCurrentLocation(),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            Set<Marker> markers = {};
            if (state is LocationLoaded) {
              markers.add(
                Marker(
                  markerId: const MarkerId('My home Location'),
                  position: state.position,
                  infoWindow: InfoWindow(title: state.address),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                ),
              );
            } else {
              markers.add(
                Marker(
                  markerId: const MarkerId('Default Location'),
                  position:
                      const LatLng(30.308949273893507, 31.703599845621095),
                  infoWindow: const InfoWindow(title: 'Default Location'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                ),
              );
            }
            return Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) =>
                      context.read<LocationCubit>().onMapCreated(controller),
                  initialCameraPosition: CameraPosition(
                    target: state is LocationLoaded
                        ? state.position
                        : const LatLng(30.308949273893507, 31.703599845621095),
                    zoom: 16,
                  ),
                  markers: markers,
                ),
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SearchBarFilter(
                    isGoogleMap: true,
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                    onPressed: () {
                      context.read<LocationCubit>().getCurrentLocation();
                    },
                    child: const Icon(
                      Icons.my_location_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
