import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showMediaOptions(BuildContext context, {required bool isImage}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.green),
            title: Text(isImage ? 'Take Photo' : 'Record Video'),
            onTap: () async {
              Navigator.pop(context);
              final file = await pickMedia(source: ImageSource.camera, isImage: isImage);
              if (file != null) {
                print('Selected file: ${file.path}');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Colors.green),
            title: Text(isImage ? 'Choose from Gallery' : 'Pick from Gallery'),
            onTap: () async {
              Navigator.pop(context);
              final file = await pickMedia(source: ImageSource.gallery, isImage: isImage);
              if (file != null) {
                print('Selected file: ${file.path}');
              }
            },
          ),
        ],
      ),
    ),
  );
}

Future<XFile?> pickMedia({
  required ImageSource source,
  required bool isImage,
}) async {
  final picker = ImagePicker();
  return isImage
      ? await picker.pickImage(source: source)
      : await picker.pickVideo(source: source);
}
