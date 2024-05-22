/// Defines the models, and specifies path to them in the API Endpoint
enum TextToImageModels {
  DREAMSHAPER_8_LCM("@cf/lykon/dreamshaper-8-lcm"),

  /// DREAMSHAPER 8 LCM
  STABLE_DIFFUSION_XL_BASE_1("@cf/stabilityai/stable-diffusion-xl-base-1.0"),

  /// STABLE DIFFUSION XL BASE 1
  STABLE_DIFFUSION_XL_LIGHTNING("@cf/bytedance/stable-diffusion-xl-lightning");

  /// STABLE DIFFUSION XL LIGHTNING

  const TextToImageModels(this.value);

  /// Constructor
  final String value;

  /// Model path
}
