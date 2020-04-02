import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/product/ProductExample.dart';
import 'package:swap_sell/controllers/product/product_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/components/spinner.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:swap_sell/model/product/product.dart';

class SearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Searchbar End Actions
    return [
      // IconButton(
      //   icon: Icon(Icons.close),
      //   onPressed: () {
      //     query = null;
      //   },
      // ),
      IconButton(
        icon: Icon(Icons.mic),
        onPressed: () {
          _initSpeechRecognizer();
          _getVoiceAstext();
        },
      ),
      IconButton(
        icon: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.indigo,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> list = ProductExamples.getList();
    return query == "" ? _buildResentSearchList(list) : _buildSearchList(query);
  }

  _buildResentSearchList(List<Product> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              onTap: () {
                AppNavigator.navigateToProductViewPage(context, list[index]);
              },
              leading: Image.network(
                list[index].images[0],
                width: 75,
              ),
              title: RichText(
                text: TextSpan(
                  text: list[index].name.substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: list[index].name.substring(query.length),
                      style: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "${list[index].getcurrancy} " +
                    list[index].retailPrice.toString(),
                style: TextStyle(
                  color: Color.fromRGBO(85, 85, 85, 1),
                ),
              ),
              // isThreeLine: true,
            ),
            Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
          ],
        );
      },
      itemCount: list.length,
    );
  }

  _buildSearchList(String query) {
    return Container(
      child: FutureBuilder(
        future: ProductController.getSearchedList(query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Spinner.getSpinner(context, 20),
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        AppNavigator.navigateToProductViewPage(
                            context, snapshot.data[index]);
                      },
                      leading: Image.network(
                        snapshot.data[index].images[0],
                        width: 75,
                      ),
                      title: RichText(
                        text: TextSpan(
                          text: snapshot.data[index].name
                              .substring(0, query.length),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: snapshot.data[index].name
                                  .substring(query.length),
                              style: TextStyle(
                                  color: Color.fromRGBO(85, 85, 85, 1)),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        "Rs " + snapshot.data[index].retailPrice.toString(),
                        style: TextStyle(color: Color.fromRGBO(85, 85, 85, 1)),
                      ),
                      // isThreeLine: true,
                    ),
                    Divider(
                      height: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                );
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
    );
  }

  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String searchQuery;
  void _initSpeechRecognizer() {
    //Start :: Initializing Speech Recognition
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler((bool result) {
      _isAvailable = result;
    });
    _speechRecognition.setRecognitionStartedHandler(() {
      _isListening = true;
    });
    _speechRecognition.setRecognitionResultHandler((String speech) {
      searchQuery = speech;
    });
    _speechRecognition.setRecognitionCompleteHandler(() {
      _isListening = false;
    });
    print("Text Initialized");
    //End :: Initializing Speech Recognition
  }

  void _getVoiceAstext() {
    if (_isAvailable && !_isListening) {
      _speechRecognition.listen(locale: "en_us").then((result) {
        print(result);
      });
    }
  }
}