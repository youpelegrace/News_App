import 'dart:convert';
import 'package:dio/dio.dart';

final dio = Dio();

class Networking {
  Future getData({
    required String getDataUrl,
  }) async {
    var response = await dio
        .get(
          getDataUrl,
        )
        .timeout(
          const Duration(seconds: 10),
        );

    var data = jsonDecode(
      response.toString(),
    );
    return data;
  }

  Future postData({
    required String postDataUrl,
    required dynamic dataMap,
  }) async {
    var response = await dio.post(postDataUrl, data: dataMap).timeout(
          const Duration(seconds: 10),
        );

    var data = jsonDecode(
      response.toString(),
    );
    return data;
  }

  Future patchData({
    required String patchDataUrl,
    required dynamic dataMap,
  }) async {
    var response = await dio.patch(patchDataUrl, data: dataMap).timeout(
          const Duration(seconds: 10),
        );

    var data = jsonDecode(
      response.toString(),
    );
    return data;
  }

  Future putData({
    required String putDataUrl,
    required dynamic dataMap,
    required String token,
  }) async {
    dio.options.headers['authorization'] = "Bearer $token";
    var response = await dio.put(putDataUrl, data: dataMap).timeout(
          const Duration(seconds: 10),
        );

    var data = jsonDecode(
      response.toString(),
    );
    return data;
  }
}
