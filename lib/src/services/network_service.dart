import 'package:dio/dio.dart';
//Network service class
class NetworkService {
  final Dio _dio = Dio(); //Dio object

  Future<Map<String, dynamic>> post(
    String url, //API endpoint
    String apiKey, //API key
    Map data, {
    bool isImage = false, //Is the data an image
  }) async {
    Response res = await _dio.post(
      url, //API endpoint
      options: Options( 
        headers: {
          "Authorization": "Bearer $apiKey", //API key
        }, //Request headers
        responseType: isImage ? ResponseType.bytes : null, //Response type
        validateStatus: (status) => true, //Validate status
      ), //Request options
      data: data, //Request data
    );
    Map<String, dynamic> response = {}; //Response object
    response['data'] = res.data; //Response data
    return response; //Return the response object
  }
}
