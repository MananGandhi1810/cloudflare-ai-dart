import 'package:cloudflare_ai/src/text_generation/raw_response_model.dart';

import '../services/network_service.dart';
import 'text_generation_models.dart';

class TextGenerationModel {
  late String accountId;
  late String apiKey;
  late TextGenerationModelsEnum model;
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

  Future<TextGenerationResponseModel> generateText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "prompt": prompt,
      "raw": raw,
    });
    TextGenerationResponseModel response =
        TextGenerationResponseModel.fromJson(res);
    return response;
  }
}
