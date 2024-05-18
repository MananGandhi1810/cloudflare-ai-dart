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
  NetworkService networkService = NetworkService();
  late String baseUrl;

  LanguageTranslationModel({
    required this.accountId,
    required this.apiKey,
    this.model = LanguageTranslationModels.M2M100_1_2B,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");
    }
  }

  // Asynchronous function which returns summarized text through the TextSummarizationResponse object
  Future<LanguageTranslationResponse> translate(
    String text,
    Languages from,
    Languages to,
  ) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "source_lang": from.value,
      "target_lang": to.value,
      "text": text,
    });
    LanguageTranslationResponse response =
        LanguageTranslationResponse.fromJson(res['data']);
    return response;
  }
}
