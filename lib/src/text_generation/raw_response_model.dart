class TextGenerationResponseModel {
  late ResultModel result;
  late bool success;

  TextGenerationResponseModel({required this.result, required this.success});

  TextGenerationResponseModel.fromJson(Map<String, dynamic> json) {
    result = ResultModel.fromJson(json['result']);
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result.toJson();
    data['success'] = success;
    return data;
  }
}

class ResultModel {
  String? response;

  ResultModel({this.response});

  ResultModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
