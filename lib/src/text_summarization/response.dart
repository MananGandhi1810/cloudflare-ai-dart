// Defines Response received from the API
import '../models/error.dart';
// Text summarization response class
class TextSummarizationResponse {
  late TextSummarizationResult? result; // Result object
  late bool success; // Success status
  late List<ErrorModel> errors; // List of errors
  late List messages; // List of messages
// Constructor
  TextSummarizationResponse({
    required this.result,
    required this.success,
    errors,
    messages,
  }) {
    this.errors = errors ?? []; // If errors is null, set it to an empty list
    this.messages = messages ?? []; // If messages is null, set it to an empty list
  }
// Function to create a response object from JSON data
  TextSummarizationResponse.fromJson(Map<String, dynamic> json) {
    result = TextSummarizationResult.fromJson(json['result']); // Create a result object from the JSON data
    success = json['success']; // Set success status
    errors =
        (json['errors'] as List).map((e) => ErrorModel.fromJson(e)).toList(); // Create a list of errors from the JSON data
    messages = json['messages']; // Set messages
  }
// Function to convert the response object to JSON data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; // Create a map to store the data
    data['result'] = result?.toJson() ?? {}; // Add the result object to the map
    data['success'] = success; // Add the success status to the map
    data['errors'] = errors.map((e) => e.toJson()).toList(); // Add the list of errors to the map
    data['messages'] = messages; // Add the list of messages to the map
    return data; // Return the map
  }
}
// Text summarization result class
class TextSummarizationResult {
  String? response; // Summarized text

  TextSummarizationResult({this.response}); // Constructor
// Function to create a result object from JSON data
  TextSummarizationResult.fromJson(Map<String, dynamic> json) {
    response = json['response']; // Set the summarized text
  }
// Function to convert the result object to JSON data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; // Create a map to store the data
    data['response'] = response; // Add the summarized text to the map
    return data; // Return the map
  }
}
