import 'dart:io';
//import 'package:AudioBooks/search.dart';
import 'package:candle_ebookv2/pdf_screen.dart';
import 'package:candle_ebookv2/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

import 'book_home.dart';


class MicScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MicScreen> {



  File? _audio;
  FlutterAudioRecorder2?  _recorder;
  Recording? _recording;
  bool isRecord = false;

  Future startRecording() async {
    String customPath = '/CandelRecords';
    Directory? appDocDirectory;
    if (Platform.isIOS) {
      appDocDirectory = await getApplicationDocumentsDirectory();
    } else {
      appDocDirectory = (await getExternalStorageDirectory());
    }
    customPath = appDocDirectory!.path + customPath + DateTime.now().toString();
    _recorder = FlutterAudioRecorder2(customPath,
        audioFormat: AudioFormat.WAV, sampleRate: 22050);
    await _recorder!.initialized;



    _recorder!.start();

    setState(() {
      isRecord = true;
    });
  }


  Future stopRecording() async {
    var result = await _recorder?.stop();
    setState(() {
      _recording = result;
      isRecord = false;
      _audio = File(_recording!.path.toString());
      print("paath ${_audio?.path}");
      print(_recording?.path.toString());
      // this is what we need
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black45 , Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          title: const Text('Home',),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => search_screen() ,
                ),
                );
              },
              icon: Icon(Icons.search),
            ),
            MaterialButton(onPressed: (
                ){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BooksHome() ,
              ),
              );
            },
              child: Icon(
                Icons.menu_book_outlined,
                color: Colors.white,
              ),
            )
          ],

        ),

        body:
        InkWell(
          onTap: (){
            if (isRecord) {
              stopRecording();
              //backend
              Get.to(PdfViewerPage());
            }
            else {
              startRecording();
            }
          },
          child: Container(
            height: double.infinity,

              child: isRecord?Lottie.asset('assets/images/2887-listen-state.json'): Center(child: Icon(Icons.mic,color: Colors.blue,size: 100,)),
          ),
        )
    );
  }
}