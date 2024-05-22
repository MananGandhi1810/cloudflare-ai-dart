import 'models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';

/// Text classification model class
class TextClassificationModel {
  /// Account ID
  late String accountId;

  /// API Key
  late String apiKey;

  /// Model to use
  late TextClassificationModels model;

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL
  late String baseUrl;

  /// Constructor
  TextClassificationModel({
    required this.accountId,
    required this.apiKey,

    /// Since there is only one model we set it to the default model, no need specify it
    this.model = TextClassificationModels.DISTILBERT_SST_2_INT8,
  }) {
    /// Set the base URL
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

    if (accountId.trim() == "") {
      /// Throw an exception if account ID is empty
      throw Exception("Account ID cannot be empty");
    }
    if (apiKey.trim() == "") {
      /// Throw an exception if API key is empty
      throw Exception("API Key cannot be empty");
    }
  }

  /// Asynchronous function which returns the classification labels with their confidence of the text
  Future<TextClassificationResponse> classifyText(String prompt) async {
    /// Post request to the API
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      /// Text to classify
      "text": prompt,
    });

    /// Return the response object
    TextClassificationResponse response =
        TextClassificationResponse.fromJson(res['data']);
    return response;
  }
}
