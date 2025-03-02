import 'package:crop_guard/featurs/cart/views/google_map/location_cubit/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationCubit extends Cubit<LocationState> {
  GoogleMapController? mapController;
  LocationCubit() : super(LocationInitial());
Location location = Location();
  Future<void> getCurrentLocation() async{
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
     final locationData = await location.getLocation();
    final position = LatLng(locationData.latitude!, locationData.longitude!);
    const address = '4517 Washington Ave. Manchester, Kentucky 39495';
    emit(LocationLoaded(position, address));
  }

  void searchLocation(String query) {
    // Implement location search logic
    emit(LocationLoaded(const LatLng(30.308949273893507, 31.703599845621095),
        '4517 Washington Ave. Manchester, Kentucky 39495'));
  }
  Future<void> checkAndRequestLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }
  Future<void> checkAndRequestLocationPermission() async {
    PermissionStatus permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
     permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }
  }
  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    location.getLocation();
  }
}
