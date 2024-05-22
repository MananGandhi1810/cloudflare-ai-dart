/// Defines the languages, and specifies their language codes
enum Languages {
  /// Afrikaans
  Afrikaans("af"),

  /// Amharic
  Amharic("am"),

  /// Arabic
  Arabic("ar"),

  /// Asturian
  Asturian("ast"),

  /// Azerbaijani
  Azerbaijani("az"),

  /// Bashkir
  Bashkir("ba"),

  /// Belarusian
  Belarusian("be"),

  /// Bulgarian
  Bulgarian("bg"),

  /// Bengali
  Bengali("bn"),

  /// Breton
  Breton("br"),

  /// Bosnian
  Bosnian("bs"),

  /// Valencian
  Valencian("ca"),

  /// Cebuano
  Cebuano("ceb"),

  /// Czech
  Czech("cs"),

  /// Welsh
  Welsh("cy"),

  /// Danish
  Danish("da"),

  /// German
  German("de"),

  /// Greek
  Greeek("el"),

  /// English
  English("en"),

  /// Spanish
  Spanish("es"),

  /// Estonian
  Estonian("et"),

  /// Persian
  Persian("fa"),

  /// Fulah
  Fulah("ff"),

  /// Finnish
  Finnish("fi"),

  /// French
  French("fr"),

  /// Western Frisian
  WesternFrisian("fy"),

  /// Irish
  Irish("ga"),

  /// Scottish Gaelic
  ScottishGaelic("gd"),

  /// Galician
  Galician("gl"),

  /// Gujarati
  Gujarati("gu"),

  /// Hausa
  Hausa("ha"),

  /// Hebrew
  Hebrew("he"),

  /// Hindi
  Hindi("hi"),

  /// Croatian
  Croatian("hr"),

  /// Haitian Creole
  HaitianCreole("ht"),

  /// Hungarian
  Hungarian("hu"),

  /// Armenian
  Armenian("hy"),

  /// Indonesian
  Indonesian("id"),

  /// Igbo
  Igbo("ig"),

  /// Iloko
  Iloko("ilo"),

  /// Icelandic
  Icelandic("is"),

  /// Italian
  Italian("it"),

  /// Japanese
  Japanese("ja"),

  /// Javanese
  Javanese("jv"),

  /// Georgian
  Georgian("ka"),

  /// Kazakh
  Kazakh("kk"),

  /// Central Khmer
  CentralKhmer("km"),

  /// Kannada
  Kannada("kn"),

  /// Korean
  Korean("ko"),

  /// Letzeburgesch
  Letzeburgesch("lb"),

  /// Ganda
  Ganda("lg"),

  /// Lingala
  Lingala("ln"),

  /// Lao
  Lao("lo"),

  /// Lithuanian
  Lithuanian("lt"),

  /// Latvian
  Latvian("lv"),

  /// Malagasy
  Malagasy("mg"),

  /// Macedonian
  Macedonian("mk"),

  /// Malayalam
  Malayalam("ml"),

  /// Mongolian
  Mongolian("mn"),

  /// Marathi
  Marathi("mr"),

  /// Malay
  Malay("ms"),

  /// Burmese
  Burmese("my"),

  /// Nepali
  Nepali("ne"),

  /// Flemish
  Flemish("nl"),

  /// Norwegian
  Norwegian("no"),

  /// Northern Sotho
  NorthernSotho("ns"),

  /// Occitan
  Occitan("oc"),

  /// Oriya
  Oriya("or"),

  /// Punjabi
  Punjabi("pa"),

  /// Polish
  Polish("pl"),

  /// Pashto
  Pashto("ps"),

  /// Portuguese
  Portuguese("pt"),

  /// Moldovan
  Moldovan("ro"),

  /// Russian
  Russian("ru"),

  /// Sindhi
  Sindhi("sd"),

  /// Sinhalese
  Sinhalese("si"),

  /// Slovak
  Slovak("sk"),

  /// Slovenian
  Slovenian("sl"),

  /// Somali
  Somali("so"),

  /// Albanian
  Albanian("sq"),

  /// Serbian
  Serbian("sr"),

  /// Swati
  Swati("ss"),

  /// Sundanese
  Sundanese("su"),

  /// Swedish
  Swedish("sv"),

  /// Swahili
  Swahili("sw"),

  /// Tamil
  Tamil("ta"),

  /// Thai
  Thai("th"),

  /// Tagalog
  Tagalog("tl"),

  /// Tswana
  Tswana("tn"),

  /// Turkish
  Turkish("tr"),

  /// Ukrainian
  Ukrainian("uk"),

  /// Urdu
  Urdu("ur"),

  /// Uzbek
  Uzbek("uz"),

  /// Vietnamese
  Vietnamese("vi"),

  /// Wolof
  Wolof("wo"),

  /// Xhosa
  Xhosa("xh"),

  /// Yiddish
  Yiddish("yi"),

  /// Yoruba
  Yoruba("yo"),

  /// Chinese
  Chinese("zh"),

  /// Zulu
  Zulu("zu");

  /// Constructor
  const Languages(this.value);

  /// Language code
  final String value;
}
