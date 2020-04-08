import 'package:flutter/material.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/config/routs.dart';

// void main() => runApp(MyApp());
void main() {
  AppInit.currentApp = new AppInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonColor: Colors.green,
        brightness: Brightness.light,
        // accentColor: Colors.black,
        backgroundColor: Colors.green[50],
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Gotham Medium",
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
