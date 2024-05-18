// Defines the models, and specifies path to them in the API Endpoint
enum TextClassificationModels {
  DISTILBERT_SST_2_INT8("@cf/huggingface/distilbert-sst-2-int8");

  const TextClassificationModels(this.value);
  final String value;
}
