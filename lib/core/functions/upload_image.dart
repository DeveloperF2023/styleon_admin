import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

 uploadImageFromCamera() async{
  final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 90);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

 uploadFileFromGallery() async {
  FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
        "jpeg",
        "svg",
        "gif",
        "PNG",
        "JPG",
        "JPEG",
        "SVG"
      ]);
  if (filePickerResult != null) {
    return File(filePickerResult.files.single.path!);
  } else {
    return null;
  }
}
