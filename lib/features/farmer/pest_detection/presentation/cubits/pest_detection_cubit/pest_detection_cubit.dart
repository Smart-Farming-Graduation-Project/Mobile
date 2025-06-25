import 'dart:io';

import 'package:crop_guard/core/helper/pick_image.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/usecases/pest_detection_image_use_case.dart';
import 'package:crop_guard/features/farmer/pest_detection/domain/usecases/pest_detection_info_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pest_detection_state.dart';

class PestDetectionCubit extends Cubit<PestDetectionState> {
  PestDetectionCubit(
      this.pestDetectionImageUseCase, this.pestDetectionInfoUseCase)
      : super(PestDetectionInitial());

  final PestDetectionImageUseCase pestDetectionImageUseCase;
  final PestDetectionInfoUseCase pestDetectionInfoUseCase;
  Future<void> getImage() async {
    final image = await pickImage();
    if (image != null) {
      emit(PestDetectionImageSelected(image: image));
    }
    else {
      emit(PestDetectionFailure(message: 'No image selected',));
    }
  }
  Future<void> getPestDetectionImage(File image) async {
    emit(PestDetectionLoading(image: image));
    final pestDetectionImage = await pestDetectionImageUseCase.call(image);
    pestDetectionImage.fold(
      (failure) => emit(PestDetectionFailure(message: failure.message, image: image)),
      (pestDetectionImage) async {
        final result =
            await pestDetectionInfoUseCase.call(pestDetectionImage.imageId);
        result.fold((failure) => emit(PestDetectionFailure(message: failure.message, image: image)),
            (pestDetectionInfo) {
          emit(PestDetectionLoaded(
              pestDetectionImage: pestDetectionImage,
              pestDetectionInfo: pestDetectionInfo.first));
        });
      },
    );
  }
}
