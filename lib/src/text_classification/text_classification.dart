import 'package:cloudflare_ai/src/text_classification/models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';

class TextClassificationModel {
  late String accountId;
  late String apiKey;
  late TextClassificationModels model;
  late bool raw;
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextClassificationModel({
    required this.accountId,
    required this.apiKey,
    this.model = TextClassificationModels.DISTILBERT_SST_2_INT8,
    this.raw = true,
  }) {
    baseUrl =
        "https://api.cloudflare.com//client/v4/accounts/$accountId/ai/run";
  }

  // Asynchronous function which returns the classification labels with their confidence of the text
  Future<TextClassificationResponse> classifyText(String prompt) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "text": prompt,
    });

    TextClassificationResponse response =
        TextClassificationResponse.fromJson(res['data']);
    return response;
  }
}
