import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';

class SavedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedViewState();
  }
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(context, "Saved", true, null),
      drawer: MyMenu.getMyMenu(context),
      body: Center(
        child: Text("Saved"),
      ),
    );
  }
}
