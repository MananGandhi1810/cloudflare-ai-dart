// Defines the models, and specifies path to them in the API Endpoint
enum TextClassificationModels {
  // DISTILBERT SST 2 INT8
  DISTILBERT_SST_2_INT8("@cf/huggingface/distilbert-sst-2-int8");

  // Constructor
  const TextClassificationModels(this.value);

  // Model path
  final String value;
}
