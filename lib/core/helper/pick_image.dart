import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Picks an image from the gallery or camera
/// 
/// Returns a [File] object of the picked image or null if no image was picked
/// Allowed image formats are JPG, JPEG, and PNG
Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
  try {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final String extension = pickedFile.path.split('.').last.toLowerCase();
      
      // Check if the file is a valid image format
      if (extension == 'jpg' || extension == 'jpeg' || extension == 'png') {
        return imageFile;
      } else {
        log('Invalid image format. Please select a JPG, JPEG, or PNG file.');
        return null;
      }
    }
    return null;
  } catch (e) {
    log('Error picking image: $e');
    return null;
  }
}
