import 'dart:io';

import 'package:cloudflare_ai/cloudflare_ai.dart';
import 'package:test/test.dart';

void main() {
  final env = Platform.environment;
  String accountId = env['ACCOUNTID'] ?? "";
  String apiKey = env['APIKEY'] ?? "";
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
        expect(res.result.response, isNotNull);
        expect(res.success, true);
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
        expect(res.result.response, isNotNull);
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
        expect(res.result.response, isNotNull);
        expect(res.success, true);
      },
      timeout: Timeout(
        Duration(minutes: 3),
      ),
    );
  });
}
