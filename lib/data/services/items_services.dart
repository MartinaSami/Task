import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:task/constants/strings.dart';
import 'package:task/data/models/items_model.dart';

class ItemsServices {
  Future<List<ItemsModel>> getItems() async {
    var dio = Dio();

    var response = await dio.get(
      AppConstants.baseUrl,
      options: Options(
          contentType: Headers.jsonContentType,
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );
    var responseData = json.encode(response.data);

    final list = json.decode(responseData) as List<dynamic>;

    return list.map((e) => ItemsModel.fromJson(e)).toList();
  }
}
