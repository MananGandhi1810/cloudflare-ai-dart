import 'dart:io';
import 'dart:typed_data';

import 'package:cloudflare_ai/cloudflare_ai.dart';

void main() async {
  String accountId = "Your Account ID";
  String apiKey = "Your API Key";

  // Text Generation
  // Initialize a TextGenerationModel
  TextGenerationModel textGenModel = TextGenerationModel(
    accountId: accountId,
    apiKey: apiKey,
    model: TextGenerationModels.GEMMA_7B_IT,
  );

  // Generate Text for a prompt
  TextGenerationResponse textGenRes = await textGenModel
      .generateText("Write a story about a robot, living on the moon");

  if (textGenRes.success) {
    print(textGenRes.result.response);
  } else {
    print(textGenRes.errors);
  }

  // Text Summarization
  // Initialize a TextSummarizationModel
  TextSummarizationModel textSummarizationModel = TextSummarizationModel(
    accountId: accountId,
    apiKey: apiKey,
    model: TextSummarizationModels
        .BART_LARGE_CNN, // Bart Large CNN is default, hence this parameter is optional
  );

  // Summarize Text
  TextSummarizationResponse textSummarizationRes =
      await textSummarizationModel.summarize(
    "Your very long text....",
    maxLength: 1024, // 1024 is default, hence this parameter is optional
  );

  if (textSummarizationRes.success) {
    print(textSummarizationRes.result.response);
  } else {
    print(textSummarizationRes.errors);
  }

  // Text to Image
  // Initialize a TextToImageModel
  TextToImageModel textToImageModel = TextToImageModel(
    accountId: accountId,
    apiKey: apiKey,
    model: TextToImageModels.DREAMSHAPER_8_LCM,
  );

  // Generate Image
  Uint8List textToImageResult =
      await textToImageModel.generateImage("An alien on the moon");

  // Save the image to a file
  File("image.png").writeAsBytes(textToImageResult);
}
