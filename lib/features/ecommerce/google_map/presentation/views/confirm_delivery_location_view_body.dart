import 'package:crop_guard/core/theme/app_colors.dart';
import 'package:crop_guard/core/theme/app_text_styles.dart';
import 'package:crop_guard/features/ecommerce/google_map/presentation/cubits/location_cubit.dart';
import 'package:crop_guard/features/ecommerce/home/presentation/widgets/search_filter_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:go_router/go_router.dart';

class ConfirmDeliveryLocationViewBody extends StatelessWidget {
  const ConfirmDeliveryLocationViewBody(
      {super.key,
      required this.position,
      required this.address,
      required this.subtotalPrice});
  final LatLng position;
  final String address;
  final double subtotalPrice;
  @override
  Widget build(BuildContext context) {
    final locationMarker = Marker(
      markerId: const MarkerId('myLocation'),
      position: position,
      infoWindow: InfoWindow(title: address),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: context.read<LocationCubit>().onMapCreated,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
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
          right: 0,
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  shape: const CircleBorder(),
                  onPressed: () {
                    context.read<LocationCubit>().updateLocation();
                  },
                  child: const Icon(Icons.my_location_rounded,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColors.kCardWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlackColor.withValues(
                        alpha: 0.1,
                      ),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address section
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.kPrimaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Delivery Address',
                            style: AppTextStyles.font16BlackBold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      address,
                      style: AppTextStyles.font14TextGrayRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),

                    // Payment button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push('/payment', extra: subtotalPrice);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          foregroundColor: AppColors.kWhiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.payment,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Proceed to Payment',
                              style: AppTextStyles.font16WhiteBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
