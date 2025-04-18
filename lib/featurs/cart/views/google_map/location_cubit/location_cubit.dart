import 'dart:developer';

import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationCubit extends Cubit<LocationState> {
  GoogleMapController? mapController;

  LocationCubit() : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());
    await checkAndRequestLocationPermission();
    final positionData = await Geolocator.getCurrentPosition();
    final position = LatLng(positionData.latitude, positionData.longitude);
    log(position.toString());

    final address = await getAddressFromLatLng(
        positionData.latitude, positionData.longitude);
    emit(LocationLoaded(position, address));
  }

  void searchLocation(String query) {
    // Implement location search logic
    emit(LocationLoaded(const LatLng(30.308949273893507, 31.703599845621095),
        '4517 Washington Ave. Manchester, Kentucky 39495'));
  }

  void updateLocation() async {
    final positionData = await Geolocator.getCurrentPosition();
    final position1 = LatLng(positionData.latitude, positionData.longitude);
    log(position1.toString());

    const position = LatLng(30.308919912456176, 31.703609142762684);
    log(position.toString());
    List<Location> locations =
        await locationFromAddress("Gronausestraat 710, Enschede");
    for (var element in locations) {
      log("location: ${element.latitude} ${element.longitude}");
    }
    final address =
        await getAddressFromLatLng(position.latitude, position.longitude);

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: position,
          zoom: 16,
        ),
      ),
    );
    emit(LocationUpdated(position, address));
  }

  Future<void> checkAndRequestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    log("latitude: $latitude, longitude: $longitude");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    log(placemarks.toString());
    return placemarks.isNotEmpty
        ? "${placemarks.first.subAdministrativeArea}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}"
        : "Unknown Address";
  }
}
