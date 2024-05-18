import 'dart:io';
import 'dart:typed_data';
import 'package:cloudflare_ai/cloudflare_ai.dart';

void main() async {
  String accountId = "";
  String apiKey = "";

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

  if (textGenRes.success && textGenRes.result != null) {
    print(textGenRes.result?.response);
  } else {
    print(textGenRes..errors.map((e) => e.toJson()).toList());
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

  if (textSummarizationRes.success && textSummarizationRes.result != null) {
    print(textSummarizationRes.result?.response);
  } else {
    print(textSummarizationRes..errors.map((e) => e.toJson()).toList());
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

  // Text Classification
  // Initialize a TextClassificationModel
  TextClassificationModel textClassificationModel = TextClassificationModel(
      accountId: accountId,
      apiKey: apiKey,
      model: TextClassificationModels
          .DISTILBERT_SST_2_INT8 // DISTILBERT_SST_2_INT8 is default, hence this parameter is optional
      );

  // Classify Text
  TextClassificationResponse textClassificationResponse =
      await textClassificationModel.classifyText(
    "Test Prompt",
  );

  if (textClassificationResponse.success &&
      textClassificationResponse.result != null) {
    print(
        'Positive Confidence level: ${textClassificationResponse.result?.positive}');
    print(
        'Negative Confidence level: ${textClassificationResponse.result?.negative}');
  } else {
    print(textSummarizationRes..errors.map((e) => e.toJson()).toList());
  }

  // Language Translation
  // Initialize a LanguageTranslationModel
  LanguageTranslationModel languageTranslationModel = LanguageTranslationModel(
    accountId: accountId,
    apiKey: apiKey,
    model: LanguageTranslationModels
        .M2M100_1_2B, // M2M100_1_2B is default, hence this parameter is optional
  );

  // Translate Text
  LanguageTranslationResponse languageTranslationRes =
      await languageTranslationModel.translate(
    "Hello",
    Languages.English,
    Languages.Hindi,
  );

  if (languageTranslationRes.success && languageTranslationRes.result != null) {
    print(languageTranslationRes.result?.response);
  } else {
    print(languageTranslationRes..errors.map((e) => e.toJson()).toList());
  }
}
