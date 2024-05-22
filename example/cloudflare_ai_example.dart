import 'dart:io';
import 'dart:typed_data';
import 'package:cloudflare_ai/cloudflare_ai.dart';
import 'package:cloudflare_ai/src/text_chat/text_chat.dart';

void main() async {
  String accountId = "Your Account ID"; // Your Account ID
  String apiKey = "Your API Key"; // Your API Key

  // Text Generation
  // Initialize a TextGenerationModel
  TextGenerationModel textGenModel = TextGenerationModel(
    accountId: accountId, // Account ID
    apiKey: apiKey, // API Key
    model: TextGenerationModels.GEMMA_7B_IT, // Model to use
  );

  // Generate Text for a prompt
  TextGenerationResponse textGenRes = await textGenModel
      .generateText("Write a story about a robot, living on the moon"); // Prompt

  if (textGenRes.success && textGenRes.result != null) {
    print(textGenRes.result?.response); // Print the generated text if request is successful
  } else {
    print(textGenRes..errors.map((e) => e.toJson()).toList()); // Print the errors if request is unsuccessful
  }

  // Text Summarization
  // Initialize a TextSummarizationModel
  TextSummarizationModel textSummarizationModel = TextSummarizationModel(
    accountId: accountId, // Account ID
    apiKey: apiKey, // API Key
    model: TextSummarizationModels
        .BART_LARGE_CNN, // Bart Large CNN is default, hence this parameter is optional
  );

  // Summarize Text
  TextSummarizationResponse textSummarizationRes =
      await textSummarizationModel.summarize(
    "Your very long text....", // Text to summarize
    maxLength: 1024, // 1024 is default, hence this parameter is optional
  );

  if (textSummarizationRes.success && textSummarizationRes.result != null) {
    print(textSummarizationRes.result?.response); // Print the summarized text
  } else {
    print(textSummarizationRes..errors.map((e) => e.toJson()).toList()); // Print the errors
  }

  // Text to Image
  // Initialize a TextToImageModel
  TextToImageModel textToImageModel = TextToImageModel(
    accountId: accountId, // Account ID
    apiKey: apiKey, // API Key
    model: TextToImageModels.DREAMSHAPER_8_LCM, // Define the model
  );

  // Generate Image
  Uint8List textToImageResult =
      await textToImageModel.generateImage("An alien on the moon"); // Prompt

  // Save the image to a file
  File("image.png").writeAsBytes(textToImageResult); // Save the image to a file

  // Text Classification
  // Initialize a TextClassificationModel
  TextClassificationModel textClassificationModel = TextClassificationModel(
      accountId: accountId, // Account ID
      apiKey: apiKey, // API Key
      model: TextClassificationModels
          .DISTILBERT_SST_2_INT8 // DISTILBERT_SST_2_INT8 is default, hence this parameter is optional
      );

  // Classify Text
  TextClassificationResponse textClassificationResponse =
      await textClassificationModel.classifyText(
    "Test Prompt", // Text to classify
  ); // Classify the text

  if (textClassificationResponse.success &&
      textClassificationResponse.result != null) {
    print(
        'Positive Confidence level: ${textClassificationResponse.result?.positive}'); // Print the positive confidence level if request is successful
    print(
        'Negative Confidence level: ${textClassificationResponse.result?.negative}'); // Print the negative confidence level if request is successful
  } else {
    print(textSummarizationRes..errors.map((e) => e.toJson()).toList()); // Print the errors if request is unsuccessful
  }

  // Language Translation
  // Initialize a LanguageTranslationModel
  LanguageTranslationModel languageTranslationModel = LanguageTranslationModel(
    accountId: accountId, // Account ID
    apiKey: apiKey, // API Key
    model: LanguageTranslationModels
        .M2M100_1_2B, // M2M100_1_2B is default, hence this parameter is optional
  );

  // Translate Text
  LanguageTranslationResponse languageTranslationRes =
      await languageTranslationModel.translate(
    "Hello", // Text to translate
    Languages.English, // Language to translate from
    Languages.Hindi, // Language to translate to
  );

  if (languageTranslationRes.success && languageTranslationRes.result != null) {
    print(languageTranslationRes.result?.response); // Print the translated text if request is successful
  } else {
    print(languageTranslationRes..errors.map((e) => e.toJson()).toList()); // Print the errors if request is unsuccessful
  }

  // Text Chat
  // Initialize a TextChatModel
  TextChatModel textChatModel = TextChatModel(
    accountId: accountId, // Account ID
    apiKey: apiKey, // API Key
    model: TextChatModels.GEMMA_7B_IT, // Model to use
  );

  // Load any previous conversations
  textChatModel.loadMessages([
    {
      "role": "user",
      "content": "Hello!",
    },
    {
      "role": "assistant",
      "content": "Hello! How may I help you?",
    },
  ]);

  // Send a new message
  ChatMessage chatRes = await textChatModel.chat("Who are you?"); // Message

  print(chatRes.content); // Print the response
}
