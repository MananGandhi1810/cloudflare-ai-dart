import 'dart:typed_data';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';

class TextToImageModel {
  late String accountId; // Account ID, available on Cloudflare daskboard
  late String apiKey; // API Key, can by generated from the Cloudflare dashboard
  late TextToImageModels model; // The model to use
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextToImageModel({
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

  // Asynchronous Function whcih returns the image in the form of Uint8List
  Future<Uint8List> generateImage(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw Exception("Prompt cannot be empty");
    }
    Map<String, dynamic> res = await networkService.post(
        "$baseUrl/${model.value}",
        apiKey,
        {
          "prompt": prompt,
        },
        isImage: true);
    try {
      Uint8List result = res['data'];
      return result;
    } catch (e) {
      print(e);
      throw Exception(res["errors"]);
    }
  }
}
