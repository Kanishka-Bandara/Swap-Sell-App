import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class VoiceRecognizer extends StatefulWidget {
  @override
  _VoiceRecognizerState createState() => _VoiceRecognizerState();
}

class _VoiceRecognizerState extends State<VoiceRecognizer> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String _resultText = "";
  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) {
      setState(() {
        _isAvailable = result;
      });
    });

    _speechRecognition.setRecognitionStartedHandler(() {
      setState(() {
        _isListening = true;
      });
    });
    _speechRecognition.setRecognitionResultHandler((String text) {
      setState(() {
        _resultText = text;
      });
    });
    _speechRecognition.setRecognitionCompleteHandler(() {
      setState(() {
        _isListening = false;
      });
    });
    _speechRecognition.activate().then((result) {
      setState(() {
        _isAvailable = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "btn1",
                    child: Icon(Icons.close),
                    onPressed: () {
                      if (_isListening) {
                        _speechRecognition.cancel().then((value){
                          setState(() {
                            _isListening = value;
                            
                          });
                        });
                      }
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "btn2",
                    child: Icon(Icons.mic),
                    onPressed: () {
                      if (_isAvailable && !_isListening) {
                        _speechRecognition.listen(locale: "en_US").then((value) {
                          setState(() {
                            _resultText = value;
                          });
                        });
                      }
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "btn3",
                    child: Icon(Icons.stop),
                    onPressed: () {
                      if (_isListening) {
                        _speechRecognition.stop().then((value) {
                          _isListening = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(children: <Widget>[Text(_resultText),],)
            ],
          )
        ],
      ),
    );
  }
}
