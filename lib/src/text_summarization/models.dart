// Defines the models, and specifies path to them in the API Endpoint
enum TextSummarizationModels {
  BART_LARGE_CNN("@cf/facebook/bart-large-cnn"); // BART LARGE CNN

  const TextSummarizationModels(this.value); // Constructor
  final String value; // Model path
}
