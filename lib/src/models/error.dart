class ErrorModel {
  late int code;
  late String message;

  ErrorModel({
    required this.code,
    required this.message,
  });

  ErrorModel.fromJson(json) {
    code = json['code'];
    message = json['message'];
  }

  Map toJson() {
    Map res = {};
    res['code'] = code;
    res['message'] = message;
    return res;
  }
}
