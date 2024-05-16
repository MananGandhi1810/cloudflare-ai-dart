class TextSummarizationResponse {
  late TextSummarizationResult result;
  late bool success;
  late List errors;
  late List messages;

  TextSummarizationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? [];
    this.messages = messages ?? [];
  }

  TextSummarizationResponse.fromJson(Map<String, dynamic> json) {
    result = TextSummarizationResult.fromJson(json['result']);
    success = json['success'];
    errors = json['errors'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result.toJson();
    data['success'] = success;
    data['errors'] = errors;
    data['messages'] = messages;
    return data;
  }
}

class TextSummarizationResult {
  String? response;

  TextSummarizationResult({this.response});

  TextSummarizationResult.fromJson(Map<String, dynamic> json) {
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    return data;
  }
}
