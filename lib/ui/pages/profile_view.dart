import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/appconfig/camera_controller.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/user_component.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

enum ClassMode { View, Edit }

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  ClassMode _classMode = ClassMode.View;
  User _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Profile",
        false,
        false,
        null,
      ),
      body: ScopedModel(
        model: AppInit.currentApp,
        child: ScopedModelDescendant<AppInit>(
          builder: (BuildContext context, Widget widget, AppInit model) {
            _user = model.getCurrentUser;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                          height: 300,
                          color: Theme.of(context).primaryColor,
                        ),
                        clipper: MyClipper(),
                      ),
                      Positioned(
                        top: 100,
                        left: MediaQuery.of(context).size.width / 2 - 75,
                        // width: 500,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: model.getCurrentUser == null ||
                                      model.getCurrentUser.getProfilePicUrl ==
                                          null ||
                                      model.getCurrentUser.getProfilePicUrl
                                          .isEmpty
                                  ? Container(
                                      width: 150.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.account_circle,
                                        size: 150,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      width: 150.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: _declareImage(model
                                              .getCurrentUser.profilePicUrl),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 210,
                        left: MediaQuery.of(context).size.width / 2 + 20,
                        child: _classMode == ClassMode.View
                            ? Container()
                            : Container(
                                // width: 150.0,
                                // height: 150.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    var file = await CameraController
                                        .defaultController
                                        .getImage(context);
                                    if (file != null) {
                                      await model.editCurruntUserImage(
                                        file,
                                      );
                                    }
                                  },
                                ),
                              ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _aboveText("Name : " +
                                model.getCurrentUser.getFName +
                                " " +
                                model.getCurrentUser.getLName),
                            _aboveText(
                                "Username : " + model.getCurrentUser.getUserId),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              _classMode == ClassMode.Edit
                                  ? UserComponent.buildUserTitleDropDown(
                                      context,
                                      (value) {
                                        _user.setTitle = value;
                                      },
                                      model.getCurrentUser.getTitle,
                                    )
                                  : KTextFormField(
                                      name: "Title",
                                      emptyRequiredMessage: null,
                                      enabled: _classMode == ClassMode.View
                                          ? false
                                          : true,
                                      onChanged: (value) {
                                        _user.setTitle = value;
                                      },
                                      onSaved: null,
                                      initialValue:
                                          model.getCurrentUser.getTitle,
                                    ),
                              KTextFormField(
                                name: "First Name",
                                emptyRequiredMessage: null,
                                enabled:
                                    _classMode == ClassMode.View ? false : true,
                                onChanged: (value) {
                                  _user.setFName = value;
                                },
                                onSaved: null,
                                initialValue: model.getCurrentUser.getFName,
                              ),
                              KTextFormField(
                                name: "Last Name",
                                emptyRequiredMessage: null,
                                enabled:
                                    _classMode == ClassMode.View ? false : true,
                                onChanged: (value) {
                                  _user.setLName = value;
                                },
                                onSaved: null,
                                initialValue: model.getCurrentUser.getLName,
                              ),
                              KTextFormField(
                                name: "Sir Name",
                                emptyRequiredMessage: null,
                                enabled:
                                    _classMode == ClassMode.View ? false : true,
                                onChanged: (value) {
                                  _user.setSName = value;
                                },
                                onSaved: null,
                                initialValue: model.getCurrentUser.getSName,
                              ),
                              KTextFormField(
                                name: "Full Name",
                                emptyRequiredMessage: null,
                                enabled:
                                    _classMode == ClassMode.View ? false : true,
                                onChanged: (value) {
                                  _user.setFullName = value;
                                },
                                onSaved: null,
                                initialValue: model.getCurrentUser.getFullName,
                              ),
                              _classMode == ClassMode.Edit
                                  ? UserComponent.buildGenderDropDown(
                                      context,
                                      (value) {
                                        _user.setGender = value;
                                      },
                                      model.getCurrentUser.getGender,
                                    )
                                  : KTextFormField(
                                      name: "Gender",
                                      emptyRequiredMessage: null,
                                      enabled: _classMode == ClassMode.View
                                          ? false
                                          : true,
                                      onChanged: (value) {
                                        _user.setGender = value;
                                      },
                                      onSaved: null,
                                      initialValue:
                                          model.getCurrentUser.getGender,
                                    ),
                              _classMode == ClassMode.Edit
                                  ? UserComponent.buildCountryDropDown(
                                      context,
                                      (value) {
                                        _user.setCountry = value;
                                      },
                                      model.getCurrentUser.getCountry,
                                    )
                                  : KTextFormField(
                                      name: "Country",
                                      emptyRequiredMessage: null,
                                      enabled: _classMode == ClassMode.View
                                          ? false
                                          : true,
                                      onChanged: (value) {
                                        _user.setCountry = value;
                                      },
                                      onSaved: null,
                                      initialValue:
                                          model.getCurrentUser.getCountry,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_classMode == ClassMode.Edit) {
                        model.editCurrentUser(_user);
                        DefaultComponents.showMessage(context,
                            "Successfully Saved", Icons.done_outline, 1);
                      }
                      setState(() {
                        _classMode == ClassMode.View
                            ? _classMode = ClassMode.Edit
                            : _classMode = ClassMode.View;
                      });
                    },
                    child: Text(
                      _classMode == ClassMode.View ? "EDIT" : "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _aboveText(String s) {
    return Text(
      s,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  _declareImage(String profilePicUrl) {
    return NetworkImage(
      profilePicUrl,
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
