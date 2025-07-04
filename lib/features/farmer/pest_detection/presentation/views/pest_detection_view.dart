import 'package:crop_guard/core/helper/build_app_bar.dart';
import 'package:crop_guard/core/services/service_locator.dart';
import 'package:crop_guard/features/farmer/pest_detection/data/repositories/pest_detection_repo_impl.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/usecases/pest_detection_image_use_case.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/usecases/pest_detection_info_use_case.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/cubits/pest_detection_cubit/pest_detection_cubit.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/cubits/pest_detection_cubit/pest_detection_state.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/image_selected_pest_detection.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/initial_pest_detection.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_failure.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_loading.dart';
import 'package:crop_guard/features/farmer/pest_detection/presentation/views/widgets/pest_detection_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PestDetectionView extends StatelessWidget {
  const PestDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Pest Detection'),
      body: BlocProvider(
        create: (context) => PestDetectionCubit(
          PestDetectionImageUseCase(
              pestDetectionRepo: getIt<PestDetectionRepoImpl>()),
          PestDetectionInfoUseCase(
              pestDetectionRepo: getIt<PestDetectionRepoImpl>()),
        ),
        child: BlocBuilder<PestDetectionCubit, PestDetectionState>(
          builder: (context, state) {
            if (state is PestDetectionInitial) {
              return const InitialPestDetection();
            } else if (state is PestDetectionImageSelected) {
              return ImageSelectedPestDetection(image: state.image);
            } else if (state is PestDetectionLoading) {
              return PestDetectionLoadingView(image: state.image);
            } else if (state is PestDetectionLoaded) {
              return PestDetectionSuccess(
                pestDetectionImageEntity: state.pestDetectionImage,
                pestDetectionInfoEntity: state.pestDetectionInfo,
              );
            } else if (state is PestDetectionFailure) {
              return PestDetectionFailureView(image: state.image!);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
