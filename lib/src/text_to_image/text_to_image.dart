import 'dart:typed_data';

import '../services/network_service.dart';
import 'models.dart';

export 'models.dart';

/// Text to image model class
class TextToImageModel {
  /// Account ID, available on Cloudflare daskboard
  late String accountId;

  /// API Key, can by generated from the Cloudflare dashboard
  late String apiKey;

  /// The model to use
  late TextToImageModels model;

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL for the API
  late String baseUrl;

  /// Constructor
  TextToImageModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
  }) {
    /// Set the base URL
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

  /// Asynchronous Function whcih returns the image in the form of Uint8List
  Future<Uint8List> generateImage(String prompt) async {
    if (prompt.trim().isEmpty) {
      /// Throw an exception if prompt is empty
      throw Exception("Prompt cannot be empty");
    }

    /// Post request to the API
    Map<String, dynamic> res = await networkService.post(
      "$baseUrl/${model.value}",
      apiKey,
      {
        "prompt": prompt,
      },
      isImage: true,
    );

    try {
      /// Get the image data
      Uint8List result = res['data'];

      /// Return the image data
      return result;
    } catch (e) {
      /// Print the error
      print(e);

      /// Throw an exception with the error message
      throw Exception(res["errors"]);
    }
  }
}
