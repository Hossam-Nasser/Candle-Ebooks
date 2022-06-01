import 'dart:io';

import 'package:image_picker/image_picker.dart';


class ImageFromPicker {


  File? _pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource src) async {
    final XFile? pickedImageFile = await _picker.pickImage(
        source: src, imageQuality: 70, maxWidth: 300, maxHeight: 300);

    if (pickedImageFile != null) {
      _pickedImage =  File(pickedImageFile.path);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

    } else {
      print("no Image Selected");
    }
  }



}