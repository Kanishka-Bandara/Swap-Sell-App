import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/auth/auth_controller.dart';
import 'package:swap_sell/controllers/auth/facebook_auth_controller.dart';
import 'package:swap_sell/controllers/auth/google_auth_controller.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/model/user/email.dart';
import 'package:swap_sell/model/user/user.dart';
import 'package:swap_sell/model/user/usertype_metadata.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/user_component.dart';
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
  String _fName = "";
  String _lName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _username = "";
  String _title;
  String _country;
  String _usernameErrorText;
  String _emailErrorText;
  String _confirmPasswordError;
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
                          UserComponent.buildUserTitleDropDown(
                            context,
                            (value) {
                              setState(() {
                                _title = value;
                              });
                            },
                            _title,
                          ),
                          KTextFormField(
                            required: true,
                            name: "First Name",
                            emptyRequiredMessage: "First name is Required",
                            onChanged: (String value) {
                              setState(() {
                                _fName = value;
                              });
                            },
                            onSaved: (String value) {
                              setState(() {
                                _fName = value;
                              });
                            },
                          ),
                          KTextFormField(
                            required: true,
                            name: "Last Name",
                            emptyRequiredMessage: "Last name is Required",
                            onChanged: (String value) {
                              setState(() {
                                _lName = value;
                              });
                            },
                            onSaved: (String value) {
                              setState(() {
                                _lName = value;
                              });
                            },
                          ),
                          KTextFormField(
                            required: true,
                            name: "Username",
                            emptyRequiredMessage: "Username is Required",
                            onChanged: (String value) async {
                              _username = value;
                              var status = await AuthController
                                  .defaultController
                                  .isUserNameAlreadyExist(value);
                              if (status) {
                                setState(() {
                                  _usernameErrorText =
                                      "Username is already Exists";
                                });
                              } else {
                                setState(() {
                                  _usernameErrorText = null;
                                });
                              }
                            },
                            onSaved: (String value) {
                              _username = value;
                            },
                            errorText: _usernameErrorText,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          KTextFormField(
                            required: true,
                            name: "Email",
                            emptyRequiredMessage: "Email is Required",
                            regExp: KRegEx.EMAIL_REG_EX,
                            regExpErrorMessage: "Please enter valid email.",
                            onChanged: (String value) async {
                              _username = value;
                              var status = await AuthController
                                  .defaultController
                                  .isEmailAlreadyExist(value);
                              if (status) {
                                setState(() {
                                  _emailErrorText = "Email is already Exists";
                                });
                              } else {
                                setState(() {
                                  _emailErrorText = null;
                                });
                              }
                            },
                            onSaved: (String value) {
                              _email = value;
                            },
                            errorText: _emailErrorText,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          UserComponent.buildCountryDropDown(
                            context,
                            (value) {
                              setState(() {
                                _country = value;
                              });
                            },
                            _country,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          KTextFormField(
                            required: true,
                            name: "Password",
                            emptyRequiredMessage: "Password is Required",
                            onChanged: (String value) {
                              _password = value;
                            },
                            onSaved: (String value) {
                              _password = value;
                            },
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
                            required: true,
                            name: "Confirem Password",
                            emptyRequiredMessage:
                                "Confirem Password is Required",
                            onChanged: (String value) {
                              _confirmPassword = value;
                              setState(() {
                                if (_password == _confirmPassword) {
                                  setState(() {
                                    _confirmPasswordError = null;
                                  });
                                } else {
                                  setState(() {
                                    _confirmPasswordError =
                                        "Passwords dosen't match.";
                                  });
                                }
                              });
                            },
                            onSaved: (String value) {
                              _confirmPassword = value;
                            },
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
                            errorText: _confirmPasswordError,
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
                              if (_emailErrorText != null) {
                                return;
                              }
                              if (_emailErrorText != null) {
                                return;
                              }
                              if (_confirmPasswordError != null) {
                                return;
                              }
                              _formKey.currentState.save();
                              User u = new User(
                                id: null,
                                userId: _username,
                                userType: UserType.SELLER_AND_BUYER,
                                title: _title,
                                gender: "Not Specified",
                                fname: _fName,
                                lname: _lName,
                                fullName: _fName + " " + _lName,
                                activeState: 1,
                                emails: [
                                  Email(
                                      id: null,
                                      emailTypeId: 1,
                                      emailType: EmailType.AUTHENTICATION,
                                      email: _email,
                                      isDefault: 1,
                                      userId: null,
                                      status: 1)
                                ],
                                country: _country,
                                status: 1,
                                addresses: null,
                                username: _username,
                              );
                              AuthenticatedUser authenticatedUser =
                                  AuthenticatedUser(
                                logInAt: DateTime.now(),
                                password: _password,
                                userName: _username,
                                status: 1,
                              );
                              AuthController.defaultController
                                  .signupUser(u, authenticatedUser, context);
                              // print(u.toJson().toString());
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
                              await FaceBookAuthController.defaultController
                                  .loginWithFB(context, AuthType.SIGNUP);
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
                            onPressed: () async {
                              await GoogleAuthController.defaultController
                                  .loginWithGoogle(context, AuthType.SIGNUP);
                            },
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
