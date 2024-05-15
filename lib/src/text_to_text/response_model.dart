class TextToTextResponseModel {
  late Result result;
  late bool success;

  TextToTextResponseModel({required this.result, required this.success});

  TextToTextResponseModel.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result']);
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result.toJson();
    data['success'] = success;
    return data;
  }
}

class Result {
  String? description;

  Result({this.description});

  Result.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    return data;
  }
}
