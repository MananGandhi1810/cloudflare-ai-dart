// Defines Response received from the API
import '../models/error.dart';

class LanguageTranslationResponse {
  late LanguageTranslationResult? result;
  late bool success;
  late List<ErrorModel> errors;
  late List messages;

  LanguageTranslationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? [];
    this.messages = messages ?? [];
  }

  LanguageTranslationResponse.fromJson(Map<String, dynamic> json) {
    result = LanguageTranslationResult.fromJson(json['result']);
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

class LanguageTranslationResult {
  String? response;

  LanguageTranslationResult({this.response});

  LanguageTranslationResult.fromJson(Map<String, dynamic> json) {
    response = json['translated_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
