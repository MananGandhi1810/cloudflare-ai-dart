// Defines Repsonse received from the API
import '../models/error.dart';

/// Text chat response class
class TextChatResponse {
  /// Result object
  late TextChatResult? result;

  /// Success status
  late bool success;

  /// List of errors
  late List<ErrorModel> errors;

  /// List of messages
  late List messages;

  /// Constructor
  TextChatResponse({
    required this.result,
    required this.success,

    /// List of errors
    errors,

    /// List of messages
    messages,
  }) {
    /// If errors is null, set it to an empty list
    this.errors = errors ?? [];

    /// If messages is null, set it to an empty list
    this.messages = messages ?? [];
  }

  /// Function to create a response object from JSON data
  TextChatResponse.fromJson(Map<String, dynamic> json) {
    /// Create a result object from the JSON data
    result = TextChatResult.fromJson(json['result']);

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

/// Text chat result class
class TextChatResult {
  /// Response text
  String? response;

  /// Constructor
  TextChatResult({this.response});

  /// Function to create a result object from JSON data
  TextChatResult.fromJson(Map<String, dynamic> json) {
    /// Set the response text
    response = json['response'];
  }

  /// Function to convert the result object to JSON data
  Map<String, dynamic> toJson() {
    /// Create a map to store the data
    final Map<String, dynamic> data = <String, dynamic>{};

    /// Add the response text to the map
    data['response'] = response;

    /// Return the map
    return data;
  }
}
