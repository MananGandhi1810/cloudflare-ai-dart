import 'models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';

/// Text classification model class
class TextClassificationModel {
  late String accountId;

  /// Account ID
  late String apiKey;

  /// API Key
  late TextClassificationModels model;

  /// Model to use
  late bool raw;

  /// Raw status
  NetworkService networkService = NetworkService();

  /// Network service object
  late String baseUrl;

  /// Base URL
  /// Constructor
  TextClassificationModel({
    required this.accountId,
    required this.apiKey,
    this.model = TextClassificationModels.DISTILBERT_SST_2_INT8,

    /// Since there is only one model we set it to the default model, no need specify it
    this.raw = true,
  }) {
    baseUrl =
        "https:///api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

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

  /// Asynchronous function which returns the classification labels with their confidence of the text
  Future<TextClassificationResponse> classifyText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "text": prompt,

      /// Text to classify
    });

    /// Post request to the API

    TextClassificationResponse response =
        TextClassificationResponse.fromJson(res['data']);
    return response;

    /// Return the response object
  }
}
