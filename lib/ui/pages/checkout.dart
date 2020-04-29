import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "CheckOut",
        false,
        false,
        null,
        null,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
