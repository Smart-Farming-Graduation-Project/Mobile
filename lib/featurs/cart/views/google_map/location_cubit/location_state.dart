import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationState {
}
class LocationInitial extends LocationState {}
class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LatLng position;
  final String address;
  LocationLoaded(this.position, this.address);
}

class LocationUpdated extends LocationState {
  final LatLng position;
  final String address;
  LocationUpdated(this.position, this.address);
}

class LocationError extends LocationState {}

//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Confirm Delivery Location',
//             style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: const ,
//     );
//   }
// }


