import 'package:dio/dio.dart';

///Network service class
class NetworkService {
  final Dio _dio = Dio();

  ///Dio object

  Future<Map<String, dynamic>> post(
    ///API endpoint
    String url,

    ///API key
    String apiKey,
    Map data, {
    ///Is the data an image
    bool isImage = false,
  }) async {
    Response res = await _dio.post(
      ///API endpoint
      url,

      ///Request options
      options: Options(
        ///Request headers
        headers: {
          ///API key
          "Authorization": "Bearer $apiKey",
        },

        ///Response type
        responseType: isImage ? ResponseType.bytes : null,

        ///Validate status
        validateStatus: (status) => true,
      ),

      ///Request data
      data: data,
    );

    ///Response object
    Map<String, dynamic> response = {};

    ///Response data
    response['data'] = res.data;

    ///Return the response object
    return response;
  }
}
