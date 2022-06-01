import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech  {

  //final String text;






  bool isSpeaking = false;
  final FlutterTts flutterTts =FlutterTts();










  //final FlutterTts flutterTts =FlutterTts();

    speak(String text)async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }
}