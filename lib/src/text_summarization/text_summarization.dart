import 'response.dart';
import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';
export 'response.dart';

class TextSummarizationModel {
  late String accountId;
  late String apiKey;
  late TextSummarizationModels model;
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextSummarizationModel({
    required this.accountId,
    required this.apiKey,
    this.model = TextSummarizationModels.BART_LARGE_CNN,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
  }

  Future<TextSummarizationResponse> summarize(String text,
      {int maxLength = 1024}) async {
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "input_text": text,
      "max_length": maxLength,
    });
    TextSummarizationResponse response =
        TextSummarizationResponse.fromJson(res['data']);
    return response;
  }
}
