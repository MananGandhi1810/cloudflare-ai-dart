// Defines Repsonse received from the API
import '../models/error.dart';

class TextGenerationResponse {
  late TextGenerationResult result;
  late bool success;
  late List<ErrorModel> errors;
  late List messages;

  TextGenerationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? [];
    this.messages = messages ?? [];
  }

  TextGenerationResponse.fromJson(Map<String, dynamic> json) {
    result = TextGenerationResult.fromJson(json['result']);
    success = json['success'];
    errors = (json['errors'] as List)
        .map((e) => ErrorModel.fromJson(e))
        .toList();
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result.toJson();
    data['success'] = success;
    data['errors'] = errors.map((e) => e.toJson()).toList();
    data['messages'] = messages;
    return data;
  }
}

class TextGenerationResult {
  String? response;

  TextGenerationResult({this.response});

  TextGenerationResult.fromJson(Map<String, dynamic> json) {
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
