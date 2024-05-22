import 'dart:typed_data';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';

/// Text to image model class
class TextToImageModel {
  late String accountId;

  /// Account ID, available on Cloudflare daskboard
  late String apiKey;

  /// API Key, can by generated from the Cloudflare dashboard
  late TextToImageModels model;

  /// The model to use
  NetworkService networkService = NetworkService();

  /// Network service object
  late String baseUrl;

  /// Base URL for the API
  /// Constructor
  TextToImageModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
  }) {
    baseUrl =
        "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

    /// Set the base URL
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");

      /// Throw an exception if account ID is empty
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");

      /// Throw an exception if API key is empty
    }
  }

  /// Asynchronous Function whcih returns the image in the form of Uint8List
  Future<Uint8List> generateImage(String prompt) async {
    if (prompt.trim().isEmpty) {
      throw Exception("Prompt cannot be empty");

      /// Throw an exception if prompt is empty
    }
    Map<String, dynamic> res = await networkService.post(
        "$baseUrl/${model.value}",
        apiKey,
        {
          "prompt": prompt,
        },
        isImage: true);

    /// Post request to the API
    try {
      Uint8List result = res['data'];

      /// Get the image data
      return result;

      /// Return the image data
    } catch (e) {
      print(e);

      /// Print the error
      throw Exception(res["errors"]);

      /// Throw an exception with the error message
    }
  }
}
