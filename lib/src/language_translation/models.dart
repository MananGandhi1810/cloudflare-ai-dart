// Defines the models, and specifies path to them in the API Endpoint
enum LanguageTranslationModels {
  // M2M100 1.2B
  M2M100_1_2B("@cf/meta/m2m100-1.2b");

  // Constructor
  const LanguageTranslationModels(this.value);

  // Model path
  final String value;
}
