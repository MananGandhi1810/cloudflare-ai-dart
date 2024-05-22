// Defines the languages, and specifies their language codes
enum Languages {
  Afrikaans("af"), // Afrikaans
  Amharic("am"), // Amharic
  Arabic("ar"), // Arabic
  Asturian("ast"), // Asturian
  Azerbaijani("az"), // Azerbaijani
  Bashkir("ba"), // Bashkir
  Belarusian("be"), // Belarusian
  Bulgarian("bg"), // Bulgarian
  Bengali("bn"), // Bengali
  Breton("br"), // Breton
  Bosnian("bs"), // Bosnian
  Valencian("ca"), // Valencian
  Cebuano("ceb"), // Cebuano
  Czech("cs"), // Czech
  Welsh("cy"), // Welsh
  Danish("da"), // Danish
  German("de"), // German
  Greeek("el"), // Greek
  English("en"), // English
  Spanish("es"), // Spanish
  Estonian("et"), // Estonian
  Persian("fa"), // Persian
  Fulah("ff"), // Fulah
  Finnish("fi"), // Finnish
  French("fr"), // French
  WesternFrisian("fy"), // Western Frisian
  Irish("ga"), // Irish
  ScottishGaelic("gd"), // Scottish Gaelic
  Galician("gl"), // Galician
  Gujarati("gu"), // Gujarati
  Hausa("ha"), // Hausa
  Hebrew("he"), // Hebrew
  Hindi("hi"), // Hindi
  Croatian("hr"), // Croatian
  HaitianCreole("ht"), // Haitian Creole
  Hungarian("hu"), // Hungarian
  Armenian("hy"), // Armenian
  Indonesian("id"), // Indonesian
  Igbo("ig"), // Igbo
  Iloko("ilo"), // Iloko
  Icelandic("is"), // Icelandic
  Italian("it"), // Italian
  Japanese("ja"), // Japanese
  Javanese("jv"), // Javanese
  Georgian("ka"), // Georgian
  Kazakh("kk"), // Kazakh
  CentralKhmer("km"), // Central Khmer
  Kannada("kn"), // Kannada
  Korean("ko"), // Korean
  Letzeburgesch("lb"), // Letzeburgesch
  Ganda("lg"), // Ganda
  Lingala("ln"), // Lingala
  Lao("lo"), // Lao
  Lithuanian("lt"), // Lithuanian
  Latvian("lv"), // Latvian
  Malagasy("mg"), // Malagasy
  Macedonian("mk"), // Macedonian
  Malayalam("ml"), // Malayalam
  Mongolian("mn"), // Mongolian
  Marathi("mr"), // Marathi
  Malay("ms"), // Malay
  Burmese("my"), // Burmese
  Nepali("ne"), // Nepali
  Flemish("nl"), // Flemish
  Norwegian("no"), // Norwegian
  NorthernSotho("ns"), // Northern Sotho
  Occitan("oc"), // Occitan
  Oriya("or"), // Oriya
  Punjabi("pa"), // Punjabi
  Polish("pl"), // Polish
  Pashto("ps"), // Pashto
  Portuguese("pt"), // Portuguese
  Moldovan("ro"), // Moldovan
  Russian("ru"), // Russian
  Sindhi("sd"), // Sindhi
  Sinhalese("si"), // Sinhalese
  Slovak("sk"), // Slovak
  Slovenian("sl"), // Slovenian
  Somali("so"), // Somali
  Albanian("sq"), // Albanian
  Serbian("sr"), // Serbian
  Swati("ss"), // Swati
  Sundanese("su"), // Sundanese
  Swedish("sv"), // Swedish
  Swahili("sw"), // Swahili
  Tamil("ta"), // Tamil
  Thai("th"), // Thai
  Tagalog("tl"), // Tagalog
  Tswana("tn"), // Tswana
  Turkish("tr"), // Turkish
  Ukrainian("uk"), // Ukrainian
  Urdu("ur"), // Urdu
  Uzbek("uz"), // Uzbek
  Vietnamese("vi"), // Vietnamese
  Wolof("wo"), // Wolof
  Xhosa("xh"), // Xhosa
  Yiddish("yi"), // Yiddish
  Yoruba("yo"), // Yoruba
  Chinese("zh"), // Chinese
  Zulu("zu"); // Zulu

  const Languages(this.value); // Constructor
  final String value; // Language code
}
