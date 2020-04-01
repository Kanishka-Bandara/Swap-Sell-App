import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SigninState();
  }
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signin'),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.of(context).pop(),),
        ),
      ),
    );
  }
}
