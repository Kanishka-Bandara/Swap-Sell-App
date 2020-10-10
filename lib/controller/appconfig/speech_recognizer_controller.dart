import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:swap_sell/config/app_navigator.dart';

class SpeechController {
  static SpeechController defaultController = new SpeechController();
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String _resultText = "Alisha";

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) {
      _isAvailable = result;
    });

    _speechRecognition.setRecognitionStartedHandler(() {
      _isListening = true;
    });
    _speechRecognition.setRecognitionResultHandler((String text) {
      _resultText = text;
    });
    _speechRecognition.setRecognitionCompleteHandler(() {
      _isListening = false;
    });
    _speechRecognition.activate().then((result) {
      _isAvailable = result;
    });
  }

  void showModel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.mic,
                    //   color: Theme.of(context).primaryColor,
                    //   size: 60,
                    // )
                    Column(
                      children: <Widget>[
                        Text(_resultText),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // FloatingActionButton(
                        //   heroTag: "btn1",
                        //   child: Icon(Icons.close),
                        //   onPressed: () {},
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        FloatingActionButton(
                          heroTag: "btn2",
                          child: Icon(Icons.mic),
                          onPressed: () {
                            if (_isAvailable && !_isListening) {
                              _speechRecognition
                                  .listen(locale: "en_US")
                                  .then((value) {
                                setState(() {
                                  _resultText = value;
                                });
                              });
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          heroTag: "btn3",
                          child: Icon(Icons.stop),
                          onPressed: () {
                            if (_isListening) {
                              _speechRecognition.cancel().then((value) {
                                setState(() {
                                  _isListening = value;
                                });
                              });
                            }
                            if (_isListening) {
                              _speechRecognition.stop().then((value) {
                                _isListening = value;
                              });
                            }
                            Navigator.of(context).pop();
                            print("=====////=== $_resultText");
                            AppNavigator.navigateToSearchPage(
                              context,
                              _resultText,
                              false,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // void close() {
  //   if (_isListening) {
  //     _speechRecognition.cancel().then((value) {
  //       _isListening = value;
  //     });
  //   }
  // }

  // String listen() {
  //   if (_isAvailable && !_isListening) {
  //     _speechRecognition.listen(locale: "en_US").then((value) {
  //       _resultText = value;
  //     });
  //     return _resultText;
  //   }
  //   return "Wrong";
  // }

  // void stop() {
  //   if (_isListening) {
  //     _speechRecognition.stop().then((value) {
  //       _isListening = value;
  //     });
  //   }
  // }
}
