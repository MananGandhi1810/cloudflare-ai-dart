// Defines Response received from the API
class TextClassificationResponse {
  late TextClassificationResult result;
  late bool success;
  late List errors;
  late List messages;

  TextClassificationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? [];
    this.messages = messages ?? [];
  }

  TextClassificationResponse.fromJson(Map<String, dynamic> json) {
    result = TextClassificationResult.fromJson(json['result']);
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

class TextClassificationResult {
  late double positive;
  late double negative;

  TextClassificationResult({required this.positive, required this.negative});

  TextClassificationResult.fromJson(List data) {
    negative =
        data.firstWhere((label) => label['label'] == "NEGATIVE")['score'];
    positive =
        data.firstWhere((label) => label['label'] == "POSITIVE")['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positive'] = positive;
    data['negative'] = negative;
    return data;
  }
}
