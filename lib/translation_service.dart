import 'package:translator/translator.dart';

class TranslationService {
  // TranslationService._();
  //
  // static TranslationService get instance => TranslationService._();

  final translator = GoogleTranslator();

  static String langCode = 'en';

  void updateLanguage(List<String> lang) {
    langCode = lang.first;
  }

  Future<String> translateString(String text) async {
    if (langCode != 'en') {
      try {
        Translation translation = await translator.translate(text, to: langCode);
        return translation.text;
      } catch (e) {
        //TODO: Translation failed message
      }
    }
    return text;
  }
}

const List<List<String>> languages = [
  ['af', 'Afrikaans'],
  ['sq', 'Albanian'],
  ['am', 'Amharic'],
  ['ar', 'Arabic'],
  ['hy', 'Armenian'],
  ['az', 'Azerbaijani'],
  ['eu', 'Basque'],
  ['be', 'Belarusian'],
  ['bn', 'Bengali'],
  ['bs', 'Bosnian'],
  ['bg', 'Bulgarian'],
  ['ca', 'Catalan'],
  ['ceb', 'Cebuano'],
  ['ny', 'Chichewa'],
  ['zh-cn', 'Chinese Simplified'],
  ['zh-tw', 'Chinese Traditional'],
  ['co', 'Corsican'],
  ['hr', 'Croatian'],
  ['cs', 'Czech'],
  ['da', 'Danish'],
  ['nl', 'Dutch'],
  ['en', 'English'],
  ['eo', 'Esperanto'],
  ['et', 'Estonian'],
  ['tl', 'Filipino'],
  ['fi', 'Finnish'],
  ['fr', 'French'],
  ['fy', 'Frisian'],
  ['gl', 'Galician'],
  ['ka', 'Georgian'],
  ['de', 'German'],
  ['el', 'Greek'],
  ['gu', 'Gujarati'],
  ['ht', 'Haitian Creole'],
  ['ha', 'Hausa'],
  ['haw', 'Hawaiian'],
  ['iw', 'Hebrew'],
  ['hi', 'Hindi'],
  ['hmn', 'Hmong'],
  ['hu', 'Hungarian'],
  ['is', 'Icelandic'],
  ['ig', 'Igbo'],
  ['id', 'Indonesian'],
  ['ga', 'Irish'],
  ['it', 'Italian'],
  ['ja', 'Japanese'],
  ['jw', 'Javanese'],
  ['kn', 'Kannada'],
  ['kk', 'Kazakh'],
  ['km', 'Khmer'],
  ['ko', 'Korean'],
  ['ku', 'Kurdish (Kurmanji)'],
  ['ky', 'Kyrgyz'],
  ['lo', 'Lao'],
  ['la', 'Latin'],
  ['lv', 'Latvian'],
  ['lt', 'Lithuanian'],
  ['lb', 'Luxembourgish'],
  ['mk', 'Macedonian'],
  ['mg', 'Malagasy'],
  ['ms', 'Malay'],
  ['ml', 'Malayalam'],
  ['mt', 'Maltese'],
  ['mi', 'Maori'],
  ['mr', 'Marathi'],
  ['mn', 'Mongolian'],
  ['my', 'Myanmar (Burmese)'],
  ['ne', 'Nepali'],
  ['no', 'Norwegian'],
  ['ps', 'Pashto'],
  ['fa', 'Persian'],
  ['pl', 'Polish'],
  ['pt', 'Portuguese'],
  ['pa', 'Punjabi'],
  ['ro', 'Romanian'],
  ['ru', 'Russian'],
  ['sm', 'Samoan'],
  ['gd', 'Scots Gaelic'],
  ['sr', 'Serbian'],
  ['st', 'Sesotho'],
  ['sn', 'Shona'],
  ['sd', 'Sindhi'],
  ['si', 'Sinhala'],
  ['sk', 'Slovak'],
  ['sl', 'Slovenian'],
  ['so', 'Somali'],
  ['es', 'Spanish'],
  ['su', 'Sundanese'],
  ['sw', 'Swahili'],
  ['sv', 'Swedish'],
  ['tg', 'Tajik'],
  ['ta', 'Tamil'],
  ['te', 'Telugu'],
  ['th', 'Thai'],
  ['tr', 'Turkish'],
  ['uk', 'Ukrainian'],
  ['ur', 'Urdu'],
  ['uz', 'Uzbek'],
  ['ug', 'Uyghur'],
  ['vi', 'Vietnamese'],
  ['cy', 'Welsh'],
  ['xh', 'Xhosa'],
  ['yi', 'Yiddish'],
  ['yo', 'Yoruba'],
  ['zu', 'Zulu']
];
