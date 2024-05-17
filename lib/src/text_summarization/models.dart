// Defines the models, and specifies path to them in the API Endpoint
enum TextSummarizationModels {
  BART_LARGE_CNN("@cf/facebook/bart-large-cnn");

  const TextSummarizationModels(this.value);
  final String value;
}
