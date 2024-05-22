// Error model
class ErrorModel {
  late int code; // Error code
  late String message; // Error message

  ErrorModel({
    required this.code,
    required this.message, 
  });

  ErrorModel.fromJson(json) {
    code = json['code']; // Set the error code
    message = json['message']; // Set the error message
  }

  Map toJson() {
    Map res = {}; // Create a map to store the data
    res['code'] = code; // Add the error code to the map
    res['message'] = message; // Add the error message to the map
    return res; // Return the map
  }
}
