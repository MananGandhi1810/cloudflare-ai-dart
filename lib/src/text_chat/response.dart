// Defines Repsonse received from the API
import '../models/error.dart';

class TextChatResponse {
  late TextChatResult? result;
  late bool success;
  late List<ErrorModel> errors;
  late List messages;

  TextChatResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? [];
    this.messages = messages ?? [];
  }

  TextChatResponse.fromJson(Map<String, dynamic> json) {
    result = TextChatResult.fromJson(json['result']);
    success = json['success'];
    errors =
        (json['errors'] as List).map((e) => ErrorModel.fromJson(e)).toList();
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result?.toJson() ?? {};
    data['success'] = success;
    data['errors'] = errors.map((e) => e.toJson()).toList();
    data['messages'] = messages;
    return data;
  }
}

class TextChatResult {
  String? response;

  TextChatResult({this.response});

  TextChatResult.fromJson(Map<String, dynamic> json) {
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
