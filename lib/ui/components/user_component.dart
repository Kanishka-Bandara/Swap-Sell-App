import 'package:flutter/material.dart';
import 'package:swap_sell/controllers/location_details_controller.dart';
import 'package:swap_sell/controllers/user/user_controller.dart';
import 'package:swap_sell/ui/widgets/kdrop_down_button.dart';

class UserComponent{
  
 static Widget buildCountryDropDown(BuildContext context,ValueChanged<dynamic> onChanged,dynamic value) {
    return FutureBuilder(
        future: LocationDetailsController.defaultcontroller.getCountryList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your Country"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Country",
            );
          }
        });
  }

 static Widget buildUserTitleDropDown(BuildContext comntext,ValueChanged<dynamic> onChanged,dynamic value) {
    return FutureBuilder(
        future: UserController.defaultUserController.getUserTitleList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your Title"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Title",
            );
          }
        });
  }

 static Widget buildGenderDropDown(BuildContext comntext,ValueChanged<dynamic> onChanged,dynamic value) {
    return FutureBuilder(
        future: UserController.defaultUserController.getGenderList(),
        builder: (context, snapshot) {
          if (snapshot == null) {
            return Container();
          } else {
            return KDropDownButton<String>(
              value: value,
              hint: Row(
                children: <Widget>[
                  Text("Select your Gender"),
                ],
              ),
              items: snapshot.data,
              onChanged: onChanged,
              title: "Gender",
            );
          }
        });
  }
}