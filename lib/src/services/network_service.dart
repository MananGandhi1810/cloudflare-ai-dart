import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post(
    String url,
    String apiKey,
    Map data, {
    bool isImage = false,
  }) async {
    Response res = await _dio.post(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey",
        },
        responseType: isImage ? ResponseType.bytes : null,
      ),
      data: data,
    );
    Map<String, dynamic> response = {};
    response['data'] = res.data;
    return response;
  }
}
