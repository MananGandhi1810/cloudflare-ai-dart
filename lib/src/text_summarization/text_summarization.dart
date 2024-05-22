import 'response.dart';
import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

/// Text summarization model class
class TextSummarizationModel {
  late String accountId;

  /// Account ID, available on Cloudflare daskboard
  late String apiKey;

  /// API Key, can by generated from the Cloudflare dashboard
  late TextSummarizationModels model;

  /// The model to use
  NetworkService networkService = NetworkService();

  /// Network service object
  late String baseUrl;

  /// Base URL for the API
  /// Constructor
  TextSummarizationModel({
    required this.accountId,
    required this.apiKey,
    this.model = TextSummarizationModels.BART_LARGE_CNN,
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

  /// Asynchronous function which returns summarized text through the TextSummarizationResponse object
  Future<TextSummarizationResponse> summarize(String text,
      {int maxLength = 1024}) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "input_text": text,

      /// Input text
      "max_length": maxLength,

      /// Maximum length
    });
    TextSummarizationResponse response =
        TextSummarizationResponse.fromJson(res['data']);

    /// Create a response object from the JSON data
    return response;

    /// Return the response object
  }
}
