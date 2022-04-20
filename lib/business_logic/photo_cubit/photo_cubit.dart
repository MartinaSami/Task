import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/photo_cubit/photo_states.dart';
import 'package:task/data/models/photo_model.dart';
import 'package:task/data/services/photo_services.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(AppInitialState());

  static PhotoCubit get(context) => BlocProvider.of(context);
  PhotoServices photoServices = PhotoServices();
  List<PhotoModel> photoList = [];

  List<PhotoModel>? getAllPhotos() {
    photoServices.getPhoto().then((value) {
      emit(SuccessGetPhoto(photoList));
      photoList = value;
    });

    return photoList;
  }
}
