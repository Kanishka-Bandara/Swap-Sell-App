import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/auth/facebook_auth_controller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/widgets/kregex.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupState();
  }
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  bool _isVisibilityOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Sign up",
        false,
        false,
        null,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/img/logo.png",
                      scale: 2.0,
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          KTextFormField(
                            name: "Username",
                            emptyRequiredMessage: "Username is Required",
                            onSaved: (String value) {
                              _username = value;
                            },
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          KTextFormField(
                            name: "Email",
                            emptyRequiredMessage: "Email is Required",
                            onSaved: (String value) {
                              _username = value;
                            },
                            regExp: KRegEx.EMAIL_REG_EX,
                            regExpErrorMessage: "Please enter valid email",
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          KTextFormField(
                            name: "Password",
                            emptyRequiredMessage: "Password is Required",
                            onSaved: (String value) {
                              _password = value;
                            },
                            // regExp: KRegEx.EMAIL_REG_EX,
                            // regExpErrorMessage: "Please enter valid password",
                            suffix: IconButton(
                              icon: Icon(_isVisibilityOff
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isVisibilityOff = !_isVisibilityOff;
                                });
                              },
                            ),
                            obscureText: _isVisibilityOff,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          KTextFormField(
                            name: "Confirem Password",
                            emptyRequiredMessage:
                                "Confirem Password is Required",
                            onSaved: (String value) {
                              _password = value;
                            },
                            // regExp: KRegEx.EMAIL_REG_EX,
                            // regExpErrorMessage: "Please enter valid password",
                            suffix: IconButton(
                              icon: Icon(_isVisibilityOff
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isVisibilityOff = !_isVisibilityOff;
                                });
                              },
                            ),
                            obscureText: _isVisibilityOff,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(
                                  "Username = $_username & password = $_password");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 0,
                      ),
                      Text("Signup with"),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.facebookSquare,
                              color: Colors.blueAccent,
                              size: 50,
                            ),
                            onPressed: () async {
                              await FaceBookAuthController.defaulyController
                                  .loginWithFB();
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.googlePlusSquare,
                              color: Colors.red,
                              size: 50,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Already have a profile?"),
                      SizedBox(
                        height: 0,
                      ),
                      FlatButton(
                        onPressed: () {
                          AppNavigator.navigateToSignInPage(context);
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
