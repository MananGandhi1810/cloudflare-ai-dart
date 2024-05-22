import 'response.dart';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

/// Text generation model class
class TextGenerationModel {
  /// Account ID, available on Cloudflare daskboard
  late String accountId;

  /// API Key, can by generated from the Cloudflare dashboard
  late String apiKey;

  /// The model to use
  late TextGenerationModels model;

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL for the API
  late String baseUrl;

  /// Constructor
  TextGenerationModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
  }) {
    /// Set the base URL
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

    /// Throw an exception if account ID is empty
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");
    }

    /// Throw an exception if API key is empty
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");
    }
  }

  /// Asynchronous function which returns generated text through the TextGenerationResponse object
  Future<TextGenerationResponse> generateText(String prompt) async {
    /// Post request to the API
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "prompt": prompt,
    });

    /// Create a response object from the JSON data
    TextGenerationResponse response =
        TextGenerationResponse.fromJson(res['data']);

    /// Return the response object
    return response;
  }
}
