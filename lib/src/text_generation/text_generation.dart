import 'response.dart';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

class TextGenerationModel {
  late String accountId;
  late String apiKey;
  late TextGenerationModels model;
  late bool raw;
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextGenerationModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
    this.raw = true,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
  }

  Future<TextGenerationResponse> generateText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "prompt": prompt,
      "raw": raw,
    });
    TextGenerationResponse response =
        TextGenerationResponse.fromJson(res['data']);
    return response;
  }
}
