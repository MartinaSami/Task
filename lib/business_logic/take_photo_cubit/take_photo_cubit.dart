import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/business_logic/take_photo_cubit/take_photo_states.dart';

class TakePhotoCubit extends Cubit<TakePhotoState> {
  TakePhotoCubit() : super(AppInitialState());

  static TakePhotoCubit get(context) => BlocProvider.of(context);

  File? imageGallery;

  final pickerGallery = ImagePicker();

  final pickerCamera = ImagePicker();

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await pickerGallery.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageGallery = File(pickedImage.path);
    } else {}
    emit(SuccessChoosePhotoFromGallery());
  }

  Future<void> openCamera() async {
    final XFile? pickedImage =
        await pickerGallery.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageGallery = File(pickedImage.path);
    } else {}
    emit(SuccessChoosePhotoFromCamera());
  }
}
