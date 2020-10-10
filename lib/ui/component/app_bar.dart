import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controller/appconfig/speech_recognizer_controller.dart';
import 'package:swap_sell/ui/widgets/icons.dart';
import 'package:swap_sell/controller/plugins/g_cloud_vision_controller.dart';

class ApplicationBar {
  static createHomeAppBar(BuildContext context) {
    return createNormalAppBar(
      context,
      "Swap&Sell",
      true,
      false,
      PreferredSize(
        preferredSize: Size(1000, 60),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 50,
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      AppNavigator.navigateToSearchPage(context, "", false);
                    },
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  AppNavigator.navigateToSearchPage(context, "", false);
                },
                child: Text(
                  "Search for anything",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // AppNavigator.navigateToVoiceRecognizer(context);
                        SpeechController.defaultController
                            .initSpeechRecognizer();
                        SpeechController.defaultController.showModel(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        String _keyWord = await GCloudVisionController
                            .defaultController
                            .getKeyWord(context);
                        if (_keyWord != null) {
                          AppNavigator.navigateToSearchPage(
                              context, _keyWord, false);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      null,
    );
  }

  static createNormalAppBar(
    BuildContext context,
    String title,
    bool showShoppingCart,
    bool showSearchIcon,
    Widget bottom, [
    List<Widget> actions,
  ]) {
    return AppBar(
      title: Text(title),
      actions: actions == null
          ? <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  children: <Widget>[
                    showSearchIcon
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              AppNavigator.navigateToSearchPage(
                                  context, "", false);
                            })
                        : Column(),
                    showShoppingCart
                        ? AppIcons.createShoppingCart(context)
                        : Column(),
                  ],
                ),
              )
            ]
          : actions,
      bottom: bottom,
    );
  }
}
