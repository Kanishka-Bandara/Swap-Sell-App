import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
          context, "Settings", false, false, null),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                AppNavigator.navigateToAddressesView(context);
              },
              child: _buildHeader("Addresses"),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[],
              ),
            ),
            _buildHeader("Change Username"),
            Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  KTextFormField(
                    name: "Current Username",
                    emptyRequiredMessage: null,
                    onSaved: null,
                    onChanged: (v) {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String header) {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            padding: EdgeInsets.only(
              top: 8,
              left: 10,
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Text(
              header,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          clipper: MyClipper(),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 50);
    path.lineTo(size.width + 150, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
