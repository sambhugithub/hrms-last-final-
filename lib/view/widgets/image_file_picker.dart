import 'package:image_picker/image_picker.dart';

class ImageFilePicker{

  final ImagePicker picker = ImagePicker();


  getImageFromCamera()async{
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return photo;
  }

  getImageFromGallery()async{
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    return photo;
  }
}