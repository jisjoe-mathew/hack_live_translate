import 'package:translator/translator.dart';

class TranslationService {
  // TranslationService._();
  //
  // static TranslationService get instance => TranslationService._();

  final translator = GoogleTranslator();

  static String langCode = 'en';

  void updateLanguage(List<String> lang) {
    langCode = lang.last;
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
  ['English', 'en'],
  ['Malayalam', 'ml'],
  ['German', 'de'],
];
