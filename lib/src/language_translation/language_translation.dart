import 'response.dart';
import '../services/network_service.dart';
import 'models.dart';
import 'languages.dart';
export 'models.dart';
export 'response.dart';
export 'languages.dart';

class LanguageTranslationModel {
  /// Account ID, available on Cloudflare daskboard
  late String accountId;

  /// API Key, can by generated from the Cloudflare dashboard
  late String apiKey;

  /// The model to use
  late LanguageTranslationModels model;

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL for the API
  late String baseUrl;

  LanguageTranslationModel({
    required this.accountId,
    required this.apiKey,
    this.model = LanguageTranslationModels.M2M100_1_2B,
  }) {
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
  Future<LanguageTranslationResponse> translate(
    /// Text to translate
    String text,

    /// Language to translate from
    Languages from,

    /// Language to translate to
    Languages to,
  ) async {
    /// Post request to the API
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      /// Source language
      "source_lang": from.value,

      /// Target language
      "target_lang": to.value,

      /// Text to translate
      "text": text,
    });

    /// Create a response object from the JSON data
    LanguageTranslationResponse response =
        LanguageTranslationResponse.fromJson(res['data']);

    /// Return the response object
    return response;
  }
}
