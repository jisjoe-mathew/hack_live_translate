import 'package:flutter/material.dart';
import 'package:hack_live_translate/translation_service.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechToText _speech = SpeechToText();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  bool _speechEnabled = false;

  void _initSpeech() async {
    _speechEnabled = await _speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speech.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  String _lastWords = '';

  void _onSpeechResult(SpeechRecognitionResult result) async {
    _lastWords = await TranslationService().translateString(result.recognizedWords);
    setState(() {});
    scrollToEnd();
  }

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Live Speech Translator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _speechEnabled
          ? GestureDetector(
              onLongPressStart: (details) {
                _startListening();
              },
              onLongPressEnd: (details) {
                _stopListening();
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: _speech.isListening == true ? Colors.white60 : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.mic,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'English ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'to ',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<List<String>>(
                  style: TextStyle(color: Colors.white),
                  dropdownColor: Colors.black,
                  value: languages.firstWhere((element) => element.last == TranslationService.langCode),
                  items: [
                    ...languages
                        .map((e) => DropdownMenuItem<List<String>>(
                              value: e,
                              child: Row(
                                children: <Widget>[
                                  AbsorbPointer(
                                    child: Checkbox(
                                      onChanged: (bool? value) {},
                                      value: e.last == TranslationService.langCode,
                                    ),
                                  ),
                                  Text(e.first),
                                ],
                              ),
                            ))
                        .toList(),
                  ],
                  onChanged: (value) {
                    TranslationService().updateLanguage(value!);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 140),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey.withOpacity(0.15),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.all(20),
                child: Text(
                  _lastWords,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    height: 1.6,
                    letterSpacing: 1.5,
                    backgroundColor: Colors.white10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
