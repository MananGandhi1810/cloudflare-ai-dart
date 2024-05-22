// Defines Response received from the API
import '../models/error.dart';

/// Text classification response class
class TextClassificationResponse {
  /// Result object
  late TextClassificationResult? result;

  /// Success status
  late bool success;

  /// List of errors
  late List<ErrorModel> errors;

  /// List of messages
  late List messages;

  /// Constructor
  TextClassificationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    /// If errors is null, set it to an empty list
    this.errors = errors ?? [];

    /// If messages is null, set it to an empty list
    this.messages = messages ?? [];
  }

  /// Function to create a response object from JSON data
  TextClassificationResponse.fromJson(Map<String, dynamic> json) {
    /// Create a result object from the JSON data
    result = TextClassificationResult.fromJson(json['result']);

    /// Set success status
    success = json['success'];

    /// Create a list of errors from the JSON data
    errors =
        (json['errors'] as List).map((e) => ErrorModel.fromJson(e)).toList();

    /// Set messages
    messages = json['messages'];
  }

  /// Function to convert the response object to JSON data
  Map<String, dynamic> toJson() {
    /// Create a map to store the data
    final Map<String, dynamic> data = <String, dynamic>{};

    /// Add the result object to the map
    data['result'] = result?.toJson() ?? {};

    /// Add the success status to the map
    data['success'] = success;

    /// Add the list of errors to the map
    data['errors'] = errors.map((e) => e.toJson()).toList();

    /// Add the list of messages to the map
    data['messages'] = messages;

    /// Return the map
    return data;
  }
}

/// Text classification result class
class TextClassificationResult {
  /// Positive score
  late double positive;

  /// Negative score
  late double negative;

  /// Constructor
  TextClassificationResult({required this.positive, required this.negative});

  /// Function to create a result object from JSON data
  TextClassificationResult.fromJson(List data) {
    /// Set the negative score
    negative =
        data.firstWhere((label) => label['label'] == "NEGATIVE")['score'];

    /// Set the positive score
    positive =
        data.firstWhere((label) => label['label'] == "POSITIVE")['score'];
  }

  /// Function to convert the result object to JSON data
  Map<String, dynamic> toJson() {
    /// Create a map to store the data
    final Map<String, dynamic> data = <String, dynamic>{};

    /// Add the positive score to the map
    data['positive'] = positive;

    /// Add the negative score to the map
    data['negative'] = negative;

    /// Return the map
    return data;
  }
}
