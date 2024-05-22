// Defines the models, and specifies path to them in the API Endpoint
enum TextToImageModels {
  // DREAMSHAPER 8 LCM
  DREAMSHAPER_8_LCM("@cf/lykon/dreamshaper-8-lcm"),

  // STABLE DIFFUSION XL BASE 1
  STABLE_DIFFUSION_XL_BASE_1("@cf/stabilityai/stable-diffusion-xl-base-1.0"),

  // STABLE DIFFUSION XL LIGHTNING
  STABLE_DIFFUSION_XL_LIGHTNING("@cf/bytedance/stable-diffusion-xl-lightning");

  // Constructor
  const TextToImageModels(this.value);

  // Model path
  final String value;
}
