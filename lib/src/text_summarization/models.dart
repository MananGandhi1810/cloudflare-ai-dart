// Defines the models, and specifies path to them in the API Endpoint
enum TextSummarizationModels {
  // BART LARGE CNN
  BART_LARGE_CNN("@cf/facebook/bart-large-cnn");

  // Constructor
  const TextSummarizationModels(this.value);

  // Model path
  final String value;
}
