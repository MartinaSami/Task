import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:task/data/models/photo_model.dart';

import '../../presentation/widgets/components.dart';

class PhotoServices {
  Future<List<PhotoModel>> getPhoto() async {
    var dio = Dio();

    var response = await dio.get(
      "https://jsonplaceholder.typicode.com/albums/$id/photos",
      options: Options(
          contentType: Headers.jsonContentType,
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );
    var responseData = json.encode(response.data);
    print(response.data);
    print(response.statusCode);

    final list = json.decode(responseData) as List<dynamic>;

    return list.map((e) => PhotoModel.fromJson(e)).toList();
  }
}
