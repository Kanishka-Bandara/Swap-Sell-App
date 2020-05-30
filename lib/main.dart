import 'package:flutter/material.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/config/routs.dart';
import 'package:swap_sell/controllers/auth/auth_controller.dart';

// void main() => runApp(MyApp());
void main() {
  AppInit.currentApp = new AppInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (AppInit.currentApp.getIsSomeOneAlreadyLoggedIn()) {
      AuthController.defaultController.getAndsetLoggedInUserDetails();
    }
    return MaterialApp(
      title: 'Swap&Sell',
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonColor: Colors.green,
        brightness: Brightness.light,
        // accentColor: Colors.black,
        backgroundColor: Colors.green[50],
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: "Gotham Medium",
        // primarySwatch: Colors.pink,
        // buttonColor: Colors.pink,
        // brightness: Brightness.light,
        // // accentColor: Colors.black,
        // backgroundColor: Colors.pink[50]
      ),
      // home: Home(),
      routes: Routes.routes,
      onUnknownRoute: Routes.onUnknownRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
