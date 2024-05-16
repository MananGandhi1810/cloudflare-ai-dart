import 'package:cloudflare_ai/cloudflare_ai.dart';
import 'package:cloudflare_ai/src/text_generation/raw_response_model.dart';
import 'package:cloudflare_ai/src/text_generation/text_generation_models.dart';
import 'package:dotenv/dotenv.dart';
import 'package:test/test.dart';

void main() {
  group('Text Generation Models', () {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    String accountId = env['ACCOUNTID'] ?? "";
    String apiKey = env['APIKEY'] ?? "";
    print(accountId);
    test(
      "Gemma 7B IT: Generate Content",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModelsEnum.GEMMA_7B_IT,
        );
        TextGenerationResponseModel res = await model.generateText("Hello!");
        expect(res.result.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );

    test(
      "Falcon 7B Instruct: Generate Content",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModelsEnum.FALCON_7B_INSTRUCT,
        );
        TextGenerationResponseModel res = await model.generateText("Hello!");
        expect(res.result.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });
}
