import 'response.dart';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

/// Text generation model class
class TextGenerationModel {
  late String accountId;

  /// Account ID, available on Cloudflare daskboard
  late String apiKey;

  /// API Key, can by generated from the Cloudflare dashboard
  late TextGenerationModels model;

  /// The model to use
  NetworkService networkService = NetworkService();

  /// Network service object
  late String baseUrl;

  /// Base URL for the API
  /// Constructor
  TextGenerationModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
  }) {
    baseUrl =
        "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

    /// Set the base URL
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");

      /// Throw an exception if account ID is empty
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");

      /// Throw an exception if API key is empty
    }
  }

  /// Asynchronous function which returns generated text through the TextGenerationResponse object
  Future<TextGenerationResponse> generateText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "prompt": prompt,
    });

    /// Post request to the API
    TextGenerationResponse response =
        TextGenerationResponse.fromJson(res['data']);

    /// Create a response object from the JSON data
    return response;

    /// Return the response object
  }
}
