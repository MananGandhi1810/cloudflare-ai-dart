import 'package:cloudflare_ai/cloudflare_ai.dart';

void main() async {
  // Initialize a TextGenerationModel
  TextGenerationModel model = TextGenerationModel(
    accountId: "Your Account ID",
    apiKey: "Your API Key",
    model: TextGenerationModels.GEMMA_7B_IT,
  );

  // Generate Text for a prompt
  TextGenerationResponse res = await model
      .generateText("Write a story about a robot, living on the moon");

  if (res.success) {
    print(res.result.response);
  } else {
    print(res.errors);
  }
}
