import 'response.dart';
import '../services/network_service.dart';
import 'models.dart';
import 'languages.dart';
export 'models.dart';
export 'response.dart';
export 'languages.dart';

class LanguageTranslationModel {
  late String accountId; // Account ID, available on Cloudflare daskboard
  late String apiKey; // API Key, can by generated from the Cloudflare dashboard
  late LanguageTranslationModels model; // The model to use
  NetworkService networkService = NetworkService(); // Network service object
  late String baseUrl; // Base URL for the API

  LanguageTranslationModel({
    required this.accountId, 
    required this.apiKey, 
    this.model = LanguageTranslationModels.M2M100_1_2B,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty"); // Throw an exception if account ID is empty
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty"); // Throw an exception if API key is empty
    }
  }

  // Asynchronous function which returns summarized text through the TextSummarizationResponse object
  Future<LanguageTranslationResponse> translate(
    String text, // Text to translate
    Languages from, // Language to translate from
    Languages to, // Language to translate to
  ) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "source_lang": from.value, // Source language
      "target_lang": to.value, // Target language
      "text": text, // Text to translate
    }); // Post request to the API
    LanguageTranslationResponse response =
        LanguageTranslationResponse.fromJson(res['data']); // Create a response object from the JSON data
    return response; // Return the response object
  }
}
