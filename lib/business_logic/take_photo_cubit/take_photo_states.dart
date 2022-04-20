abstract class TakePhotoState {}

class AppInitialState extends TakePhotoState {}

class SuccessChoosePhotoFromGallery extends TakePhotoState {
  SuccessChoosePhotoFromGallery();
}

class SuccessChoosePhotoFromCamera extends TakePhotoState {
  SuccessChoosePhotoFromCamera();
}
