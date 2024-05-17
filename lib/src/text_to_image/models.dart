enum TextToImageModels {
  DREAMSHAPER_8_LCM("@cf/lykon/dreamshaper-8-lcm"),
  STABLE_DIFFUSION_XL_BASE_1("@cf/stabilityai/stable-diffusion-xl-base-1.0"),
  STABLE_DIFFUSION_XL_LIGHTNING("@cf/bytedance/stable-diffusion-xl-lightning");

  const TextToImageModels(this.value);
  final String value;
}
