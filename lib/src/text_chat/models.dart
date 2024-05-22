// Defines the models, and specifies path to them in the API Endpoint
enum TextChatModels {
  LLAMA_2_7B("@cf/meta/llama-2-7b-chat-fp16"), // LLAMA 2.7B
  LLAMA_2_7B_INT8("@cf/meta/llama-2-7b-chat-int8"), // LLAMA 2.7B INT8
  MISTRAL_7B("@cf/mistral/mistral-7b-instruct-v0.1"), // MISTRAL 7B
  CODE_LLAMA_7B("@hf/thebloke/codellama-7b-instruct-awq"), // CODE LLAMA 7B
  CODE_LLAMA_2_13B("@hf/thebloke/llama-2-13b-chat-awq"), // CODE LLAMA 2.13B
  ZEPHYR_7B("@hf/thebloke/zephyr-7b-beta-awq"), // ZEPHYR 7B
  MISTRAL_7B_AWQ_V01("@hf/thebloke/mistral-7b-instruct-v0.1-awq"), // MISTRAL 7B AWQ V0.1
  MISTRAL_7B_AWQ_V02("@hf/mistral/mistral-7b-instruct-v0.2"), // MISTRAL 7B AWQ V0.2
  OPENHERMES_MISTRAL_7B("@hf/thebloke/openhermes-2.5-mistral-7b-awq"), // OPENHERMES MISTRAL 7B
  NEURAL_CHAT_7B("@hf/thebloke/neural-chat-7b-v3-1-awq"), // NEURAL CHAT 7B
  LLAMA_GUARD_7B("@hf/thebloke/llamaguard-7b-awq"), // LLAMA GUARD 7B
  DEEPSEEK_CODER_6_7_BASE("@hf/thebloke/deepseek-coder-6.7b-base-awq"), // DEEPSEEK CODER 6.7 BASE
  DEEPSEEK_CODER_6_7_INSTRUCT("@hf/thebloke/deepseek-coder-6.7b-instruct-awq"), // DEEPSEEK CODER 6.7 INSTRUCT
  DEEPSEEK_MATH_7B_BASE("@cf/deepseek-ai/deepseek-math-7b-base"), // DEEPSEEK MATH 7B BASE
  DEEPSEEK_MATH_7B_INSTRUCT("@cf/deepseek-ai/deepseek-math-7b-instruct"), // DEEPSEEK MATH 7B INSTRUCT
  OPENCHAT_3_5("@cf/openchat/openchat-3.5-0106"), // OPENCHAT 3.5
  PHI_2("@cf/phi/phi-2"), // PHI 2
  TINYLAMA_1_1B("@cf/tinyllama/tinyllama-1.1b-chat-v1.0"), // TINYLAMA 1.1B
  DISCOLM_GERMAN_7B("@cf/thebloke/discolm-german-7b-v1-awq"), // DISCOLM GERMAN 7B
  QWEN_1_5_0_5B_CHAT("@cf/qwen/qwen-1.5.0.5b-chat"), // QWEN 1.5.0.5B
  QWEN1_5_1_8B_CHAT("@cf/qwen/qwen1.5-1.8b-chat"), // QWEN1 5.1.8B
  QWEN_1_5_7B_CHAT_AWQ("@cf/qwen/qwen1.5-7b-chat-awq"), // QWEN 1.5 7B
  QWEN_1_5_14B_CHAT_AWQ("@cf/qwen/qwen1.5-14b-chat-awq"), // QWEN 1.5 14B
  FALCON_7B_INSTRUCT("@cf/tiiuae/falcon-7b-instruct"), // FALCON 7B
  GEMMA_2B_IT_LORA("@cf/google/gemma-2b-it-lora"), // GEMMA 2B IT LORA
  GEMMA_7B_IT("@hf/google/gemma-7b-it"), // GEMMA 7B IT
  GEMMA_7B_IT_LORA("@cf/google/gemma-7b-it-lora"), // GEMMA 7B IT LORA
  HERMES_2_PRO_7B("@hf/nousresearch/hermes-2-pro-mistral-7b"), // HERMES 2 PRO 7B
  LLAMA_2_7B_CHAT_HF_LORA("@cf/meta-llama/llama-2-7b-chat-hf-lora"), // LLAMA 2 7B CHAT HF LORA
  LLAMA_3_8B_INSTRUCT("@hf/meta-llama/meta-llama-3-8b-instruct"), // LLAMA 3 8B INSTRUCT
  UNA_CYBERTRON_7B_V2_BF16("@cf/fblgit/una-cybertron-7b-v2-bf16"), // UNA CYBERTRON 7B V2 BF16
  STARLING_LM_7B_BETA("@hf/nexusflow/starling-lm-7b-beta"), // STARLING LM 7B BETA
  SQL_CODER_7B_2("@cf/defog/sqlcoder-7b-2"); // SQL CODER 7B 2

  const TextChatModels(this.value); // Constructor
  final String value; // Model path
}
