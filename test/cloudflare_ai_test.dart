import 'dart:io';
import 'dart:typed_data';
import 'package:cloudflare_ai/cloudflare_ai.dart';
import 'package:test/test.dart';

void main() {
  final env = Platform.environment;
  String accountId = env['ACCOUNTID'] ?? "1cce28ed87f1c4865e511c1abd3f0101";
  String apiKey = env['APIKEY'] ?? "TxzHZU9gfVuHMVlC_M-pW1H7d9RpDE7OD_OIW2rY";
  group('Text Generation:', () {
    test(
      "Gemma 7b IT",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModels.GEMMA_7B_IT,
        );
        TextGenerationResponse res = await model.generateText("Hello!");
        expect(res.result?.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );

    test(
      "Gemma 7b IT (Empty Prompt)",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModels.GEMMA_7B_IT,
        );
        TextGenerationResponse res = await model.generateText("");
        expect(res.result?.response, null);
        expect(res.success, false);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );

    test(
      "Hermes 2 Pro 7b Instruct",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModels.HERMES_2_PRO_7B,
        );
        TextGenerationResponse res = await model.generateText("Hello!");
        expect(res.result?.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });

  group("Text Summarization:", () {
    test(
      "Bart Large CNN",
      () async {
        TextGenerationModel model = TextGenerationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextGenerationModels.HERMES_2_PRO_7B,
        );
        TextGenerationResponse res = await model.generateText("""
In the heart of India, nestled amidst the vibrant chaos of Mumbai, an extraordinary event was about to unfold. It was a warm evening when the sky was painted with hues of pink and orange, and the bustling streets hummed with the rhythm of life. Little did the people know that they were about to witness something beyond their wildest imaginations.
Amidst the crowded streets, a shimmering portal opened, and out stepped Zarael, an alien explorer from a distant galaxy. With slender limbs and iridescent skin, Zarael drew curious glances from the passersby, who stopped in their tracks, their eyes widening with disbelief.
Unfazed by the attention, Zarael glanced around, taking in the sights and sounds of this new world. Their mission was clear - to observe and understand the diverse cultures of Earth, starting with the vibrant tapestry of India.
As Zarael wandered through the streets, they encountered a myriad of sights and experiences - the tantalizing aromas of street food wafting through the air, the vibrant colors of traditional clothing adorning the bustling markets, and the melodious strains of music that filled the air.
Intrigued by the customs and traditions of this fascinating land, Zarael decided to immerse themselves in the local culture. They sampled spicy chaat at a roadside stall, danced to the rhythmic beats of a Bollywood song blaring from a nearby shop, and marveled at the intricate designs of henna adorning the hands of passing women.
But amidst the hustle and bustle of the city, Zarael also witnessed moments of compassion and kindness that touched their alien heart. They saw strangers helping each other navigate the chaotic streets, families sharing meals with neighbors, and children laughing and playing in the narrow alleyways.
As the night descended upon the city, Zarael found themselves atop a hill overlooking the twinkling lights of Mumbai below. From this vantage point, they gazed up at the stars, feeling a sense of connection to the vast universe beyond.
In that moment, Zarael realized that despite the differences that may exist between worlds, there was a universal thread that bound all beings together - the thread of humanity, of compassion, and of love.
And so, with a newfound appreciation for the beauty of Earth and its inhabitants, Zarael bid farewell to India, knowing that they would carry the memories of this extraordinary journey with them forever. As they stepped back through the shimmering portal, they left behind a world forever changed by their presence, a world where the possibility of encountering the unknown was no longer a distant dream, but a tangible reality.
""");
        expect(res.result?.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });

  group("Text To Image:", () {
    test("DreamShaper 8 LCM (Empty Prompt)", () {
      expect(
        () async {
          TextToImageModel model = TextToImageModel(
            accountId: accountId,
            apiKey: apiKey,
            model: TextToImageModels.DREAMSHAPER_8_LCM,
          );
          await model.generateImage("");
        },
        throwsException,
      );
    });

    test("DreamShaper 8 LCM", () async {
      TextToImageModel model = TextToImageModel(
        accountId: accountId,
        apiKey: apiKey,
        model: TextToImageModels.DREAMSHAPER_8_LCM,
      );
      Uint8List res = await model.generateImage("An alien on the moon");
      expect(res, isNotNull);
    });

    test("Stable Diffusion XL Base 1", () async {
      TextToImageModel model = TextToImageModel(
        accountId: accountId,
        apiKey: apiKey,
        model: TextToImageModels.STABLE_DIFFUSION_XL_BASE_1,
      );
      Uint8List res = await model.generateImage("An alien on the moon");
      expect(res, isNotNull);
    });
  });

  group('Text Classification:', () {
    test(
      "Distilbert sst 2 int8",
      () async {
        TextClassificationModel model = TextClassificationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: TextClassificationModels.DISTILBERT_SST_2_INT8,
        );
        TextClassificationResponse res =
            await model.classifyText("Hello this is good");
        expect(res.result?.positive, isNotNull);
        expect(res.result?.negative, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });

  group('Language Translation:', () {
    test(
      "m2m100 1.2b (English to Hindi)",
      () async {
        LanguageTranslationModel model = LanguageTranslationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: LanguageTranslationModels.M2M100_1_2B,
        );
        LanguageTranslationResponse res = await model.translate(
          "Hello!",
          Languages.English,
          Languages.Hindi,
        );
        expect(res.result?.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );

    test(
      "m2m100 1.2b (Hindi to Marathi)",
      () async {
        LanguageTranslationModel model = LanguageTranslationModel(
          accountId: accountId,
          apiKey: apiKey,
          model: LanguageTranslationModels.M2M100_1_2B,
        );
        LanguageTranslationResponse res = await model.translate(
          "Hello!",
          Languages.English,
          Languages.Marathi,
        );
        expect(res.result?.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });
}
