import 'package:task/data/models/photo_model.dart';

abstract class PhotoState {}

class AppInitialState extends PhotoState {}

class SuccessGetPhoto extends PhotoState {
  final List<PhotoModel> photoList;

  SuccessGetPhoto(this.photoList);
}
