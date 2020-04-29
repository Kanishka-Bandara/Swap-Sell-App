import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';

class Preparation extends StatefulWidget {
  @override
  _PreparationState createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Preparation",
        false,
        false,
        null,
        null,
      ),
      body: Column(),
    );
  }
}
