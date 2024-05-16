# Cloudflare-AI-Dart

A Dart client for accessing the Cloudflare AI API.

## Usage

### Text Generation

```dart
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
```

Supported Models:

- LLAMA_2_7B
- LLAMA_2_7B_INT8
- MISTRAL_7B
- CODE_LLAMA_7B
- CODE_LLAMA_2_13B
- ZEPHYR_7B
- MISTRAL_7B_AWQ_V01
- MISTRAL_7B_AWQ_V02
- OPENHERMES_MISTRAL_7B
- NEURAL_CHAT_7B
- LLAMA_GUARD_7B
- DEEPSEEK_CODER_6_7_BASE
- DEEPSEEK_CODER_6_7_INSTRUCT
- DEEPSEEK_MATH_7B_BASE
- DEEPSEEK_MATH_7B_INSTRUCT
- OPENCHAT_3_5
- PHI_2
- TINYLAMA_1_1B
- DISCOLM_GERMAN_7B
- QWEN_1_5_0_5B_CHAT
- QWEN1_5_1_8B_CHAT
- QWEN_1_5_7B_CHAT_AWQ
- QWEN_1_5_14B_CHAT_AWQ
- FALCON_7B_INSTRUCT
- GEMMA_2B_IT_LORA
- GEMMA_7B_IT
- GEMMA_7B_IT_LORA
- HERMES_2_PRO_7B
- LLAMA_2_7B_CHAT_HF_LORA
- LLAMA_3_8B_INSTRUCT
- UNA_CYBERTRON_7B_V2_BF16
- STARLING_LM_7B_BETA
- SQL_CODER_7B_2

### Text Summarization

```dart
import 'package:cloudflare_ai/cloudflare_ai.dart';

void main() async {
  // Initialize a TextSummarizationModel
  TextSummarizationModel model = TextSummarizationModel(
    accountId: "Your Account ID",
    apiKey: "Your API Key",
    model: TextSummarizationModels.BART_LARGE_CNN,
  );

  // Summarize Text
  TextSummarizationResponse res = await model.summarize(
      "The quick brown fox jumps over the lazy dog",
      maxLength: 10,
    );

  if (res.success) {
    print(res.result.summary);
  } else {
    print(res.errors);
  }
}
```

## Features

- [x] Text Generation
- [x] Text Summarization
- [ ] Image Generation
- [ ] Text Classification
- [ ] Image Classification
