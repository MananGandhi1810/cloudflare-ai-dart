/// Error model
class ErrorModel {
  /// Error code
  late int code;

  /// Error message
  late String message;

  ErrorModel({
    required this.code,
    required this.message,
  });

  ErrorModel.fromJson(json) {
    /// Set the error code
    code = json['code'];

    /// Set the error message
    message = json['message'];
  }

  Map toJson() {
    /// Create a map to store the data
    Map res = {};

    /// Add the error code to the map
    res['code'] = code;

    /// Add the error message to the map
    res['message'] = message;

    /// Return the map
    return res;
  }
}
