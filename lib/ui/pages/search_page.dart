import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controller/plugins/g_cloud_vision_controller.dart';
import 'package:swap_sell/sample_data/ProductExample.dart';
import 'package:swap_sell/controller/product/product_controller.dart';
import 'package:swap_sell/controller/saved/saved_product_controller.dart';
import 'package:swap_sell/controller/saved/saved_searches_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/saved/saved_product.dart';
import 'package:swap_sell/model/saved/saved_search.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:swap_sell/model/product/product.dart';

class SearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Searchbar End Actions
    return this.query == "" || this.query == null
        ? <Widget>[
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                _initSpeechRecognizer();
                _getVoiceAstext();
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () async {
                String _keyWord = await GCloudVisionController.defaultController
                    .getKeyWord(context);
                if (_keyWord != null) {
                  AppNavigator.navigateToSearchPage(
                    context,
                    _keyWord,
                    true,
                  );
                }
              },
            ),
          ]
        : <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                query = "";
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                SavedSearch savedSearch = SavedSearch(
                  id: 3,
                  savedAt: DateTime.now(),
                  query: query,
                  serachedAt: DateTime.now(),
                  status: 1,
                );
                SavedSearchesController.defaultController
                    .addToSavedList(savedSearch);
              },
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
                list[index].getImages[0],
                width: 75,
              ),
              title: RichText(
                text: TextSpan(
                  text: list[index].getName.substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: list[index].getName.substring(query.length),
                      style: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1),
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(
                "${list[index].getCurrency} " +
                    list[index].getRetailPrice.toString(),
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
        future: ProductController.defaultController.getSearchedList(query),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      ShimmerTile(
                          MediaQuery.of(context).size.width, 75, context),
                      Divider(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                          "Rs " +
                              snapshot.data[index].getRetailPrice.toString(),
                          style:
                              TextStyle(color: Color.fromRGBO(85, 85, 85, 1)),
                        ),
                        // isThreeLine: true,
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () async {
                            SavedProductsController.defaultController
                                .addToSavedList(
                              SavedProduct(
                                id: 1,
                                product: snapshot.data[index],
                                savedAt: DateTime.now(),
                                status: 1,
                              ),
                            );
                          },
                        )),
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
