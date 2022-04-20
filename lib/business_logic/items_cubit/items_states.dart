import 'package:task/data/models/items_model.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class Success extends AppState {
  final List<ItemsModel> itemsList;

  Success(this.itemsList);
}
