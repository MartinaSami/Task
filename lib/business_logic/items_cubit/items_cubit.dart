import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/items_cubit/items_states.dart';
import 'package:task/data/models/items_model.dart';
import 'package:task/data/services/items_services.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  ItemsServices businessServices = ItemsServices();
  List<ItemsModel> itemsList = [];

  List<ItemsModel>? getAllItems() {
    businessServices.getItems().then((value) {
      emit(Success(itemsList));
      itemsList = value;
    });

    return itemsList;
  }
}
