// Defines the models, and specifies path to them in the API Endpoint
enum TextChatModels {
  LLAMA_2_7B("@cf/meta/llama-2-7b-chat-fp16"),
  LLAMA_2_7B_INT8("@cf/meta/llama-2-7b-chat-int8"),
  MISTRAL_7B("@cf/mistral/mistral-7b-instruct-v0.1"),
  CODE_LLAMA_7B("@hf/thebloke/codellama-7b-instruct-awq"),
  CODE_LLAMA_2_13B("@hf/thebloke/llama-2-13b-chat-awq"),
  ZEPHYR_7B("@hf/thebloke/zephyr-7b-beta-awq"),
  MISTRAL_7B_AWQ_V01("@hf/thebloke/mistral-7b-instruct-v0.1-awq"),
  MISTRAL_7B_AWQ_V02("@hf/mistral/mistral-7b-instruct-v0.2"),
  OPENHERMES_MISTRAL_7B("@hf/thebloke/openhermes-2.5-mistral-7b-awq"),
  NEURAL_CHAT_7B("@hf/thebloke/neural-chat-7b-v3-1-awq"),
  LLAMA_GUARD_7B("@hf/thebloke/llamaguard-7b-awq"),
  DEEPSEEK_CODER_6_7_BASE("@hf/thebloke/deepseek-coder-6.7b-base-awq"),
  DEEPSEEK_CODER_6_7_INSTRUCT("@hf/thebloke/deepseek-coder-6.7b-instruct-awq"),
  DEEPSEEK_MATH_7B_BASE("@cf/deepseek-ai/deepseek-math-7b-base"),
  DEEPSEEK_MATH_7B_INSTRUCT("@cf/deepseek-ai/deepseek-math-7b-instruct"),
  OPENCHAT_3_5("@cf/openchat/openchat-3.5-0106"),
  PHI_2("@cf/phi/phi-2"),
  TINYLAMA_1_1B("@cf/tinyllama/tinyllama-1.1b-chat-v1.0"),
  DISCOLM_GERMAN_7B("@cf/thebloke/discolm-german-7b-v1-awq"),
  QWEN_1_5_0_5B_CHAT("@cf/qwen/qwen-1.5.0.5b-chat"),
  QWEN1_5_1_8B_CHAT("@cf/qwen/qwen1.5-1.8b-chat"),
  QWEN_1_5_7B_CHAT_AWQ("@cf/qwen/qwen1.5-7b-chat-awq"),
  QWEN_1_5_14B_CHAT_AWQ("@cf/qwen/qwen1.5-14b-chat-awq"),
  FALCON_7B_INSTRUCT("@cf/tiiuae/falcon-7b-instruct"),
  GEMMA_2B_IT_LORA("@cf/google/gemma-2b-it-lora"),
  GEMMA_7B_IT("@hf/google/gemma-7b-it"),
  GEMMA_7B_IT_LORA("@cf/google/gemma-7b-it-lora"),
  HERMES_2_PRO_7B("@hf/nousresearch/hermes-2-pro-mistral-7b"),
  LLAMA_2_7B_CHAT_HF_LORA("@cf/meta-llama/llama-2-7b-chat-hf-lora"),
  LLAMA_3_8B_INSTRUCT("@hf/meta-llama/meta-llama-3-8b-instruct"),
  UNA_CYBERTRON_7B_V2_BF16("@cf/fblgit/una-cybertron-7b-v2-bf16"),
  STARLING_LM_7B_BETA("@hf/nexusflow/starling-lm-7b-beta"),
  SQL_CODER_7B_2("@cf/defog/sqlcoder-7b-2");

  const TextChatModels(this.value);
  final String value;
}
