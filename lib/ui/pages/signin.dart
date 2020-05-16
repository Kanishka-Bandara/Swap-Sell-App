import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/auth/auth_controller.dart';
import 'package:swap_sell/controllers/auth/facebook_auth_controller.dart';
import 'package:swap_sell/controllers/auth/google_auth_controller.dart';
import 'package:swap_sell/model/user/authenticated_user.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SigninState();
  }
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  bool _isVisibilityOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Sign in",
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
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/img/logo.png",
                      scale: 1.5,
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
                            required: true,
                            emptyRequiredMessage: "Username is Required",
                            onSaved: (String value) {
                              _username = value;
                            },
                            // regExp: KRegEx.EMAIL_REG_EX,
                            // regExpErrorMessage: "Please enter valid email",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          KTextFormField(
                            name: "Password",
                            required: true,
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
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async{
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              AuthenticatedUser au = AuthenticatedUser(
                                userName: _username,
                                password: _password,
                              );
                              bool state =await AuthController.defaultController.signInWithNormal(au, context);
                              if (state == false) {
                                setState(() {
                                  _password=null;
                                });
                                print("Bad Credentials");
                                // TODO::Show message
                                // DefaultComponents.showMessage(
                                //   context,
                                //   "You are not signin with your facebook account./nPlease signup with your account.",
                                //   Icons.error,
                                //   3,
                                // );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("Signin with"),
                      SizedBox(
                        height: 10,
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
                              bool state = await FaceBookAuthController
                                  .defaultController
                                  .loginWithFB(context, AuthType.SIGNIN);
                              if (state == false) {
                                FaceBookAuthController.defaultController
                                    .logout();
                                print("Wrong details");
                                // TODO::Show message
                                // DefaultComponents.showMessage(
                                //   context,
                                //   "You are not signin with your facebook account./nPlease signup with your account.",
                                //   Icons.error,
                                //   3,
                                // );
                              }
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
                              bool state = await GoogleAuthController
                                  .defaultController
                                  .loginWithGoogle(context, AuthType.SIGNIN);
                              if (state == false) {
                                GoogleAuthController.defaultController.logOut();
                                print("Wrong details");
                                // TODO::Show message
                                // DefaultComponents.showMessage(
                                //   context,
                                //   "You are not signin with your google account./nPlease signup with your account.",
                                //   Icons.error,
                                //   3,
                                // );
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Do not have a profile?"),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () {
                          AppNavigator.navigateToSignUpPage(context);
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 25,
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
