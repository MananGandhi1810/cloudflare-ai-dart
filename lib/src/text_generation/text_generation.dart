import 'response.dart';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

class TextGenerationModel {
  late String accountId; // Account ID, available on Cloudflare daskboard
  late String apiKey; // API Key, can by generated from the Cloudflare dashboard
  late TextGenerationModels model; // The model to use
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextGenerationModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");
    }
  }

  // Asynchronous function which returns generated text through the TextGenerationResponse object
  Future<TextGenerationResponse> generateText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "prompt": prompt,
    });
    TextGenerationResponse response =
        TextGenerationResponse.fromJson(res['data']);
    return response;
  }
}
