import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post(String url, String apiKey, Map data) async {
    Response res = await _dio.post(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey",
        },
      ),
      data: data,
    );
    return res.data;
  }
}
