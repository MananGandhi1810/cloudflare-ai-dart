import 'response.dart';
import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

/// Text summarization model class
class TextSummarizationModel {
  /// Account ID, available on Cloudflare daskboard
  late String accountId;

  /// API Key, can by generated from the Cloudflare dashboard
  late String apiKey;

  /// The model to use
  late TextSummarizationModels model;

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL for the API
  late String baseUrl;

  /// Constructor
  TextSummarizationModel({
    required this.accountId,
    required this.apiKey,
    this.model = TextSummarizationModels.BART_LARGE_CNN,
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

  /// Asynchronous function which returns summarized text through the TextSummarizationResponse object
  Future<TextSummarizationResponse> summarize(String text,
      {int maxLength = 1024}) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      /// Input text
      "input_text": text,

      /// Maximum length
      "max_length": maxLength,
    });

    /// Create a response object from the JSON data
    TextSummarizationResponse response =
        TextSummarizationResponse.fromJson(res['data']);

    /// Return the response object
    return response;
  }
}
