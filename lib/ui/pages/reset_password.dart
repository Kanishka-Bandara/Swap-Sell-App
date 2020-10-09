import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controller/auth/auth_controller.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/message_components.dart';
import 'package:swap_sell/ui/widgets/kregex.dart';

enum ResetPasswordView {
  EMAIL_VIEW,
  CODE_VIEW,
  ENTER_PASSWORD,
}

class ResetPassword extends StatefulWidget {
  ResetPasswordView _view = ResetPasswordView.EMAIL_VIEW;
  ResetPassword();
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String _emailTyped;
  String _codeTyped;
  String _codeReceived;
  String _passwordTyped;
  String _passwordReTyped;
  bool _isVisibilityOff = true;
  bool _isVisibilityOffRe = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Reset Password",
        false,
        false,
        null,
      ),
      body: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget._view == ResetPasswordView.EMAIL_VIEW
                    ? _buildEmailField(context)
                    : (widget._view == ResetPasswordView.CODE_VIEW
                        ? _buildCodeView(context)
                        : _buildPasswordEnterView(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildEmailField(BuildContext _context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your email address here...",
              labelText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) {
              setState(() {
                this._emailTyped = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () async {
              if (_isValidatedEmail(_emailTyped, _context)) {
                await _checkEmailAndSendCode(_context);
              } else {}
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _buildCodeView(BuildContext _context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your verification code here...",
              labelText: "Verification Code",
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                this._codeTyped = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              print("typed = $_codeTyped | received = $_codeReceived");
              if (_codeTyped == _codeReceived) {
                _changeView(ResetPasswordView.ENTER_PASSWORD);
              } else {
                DefaultComponents.showMessage(
                  _context,
                  "Code does not matched..!\nPlease re enter.",
                  Icons.error_outline,
                  2,
                );
              }
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _buildPasswordEnterView(BuildContext _context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your password here...",
              labelText: "Password",
              suffix: IconButton(
                icon: Icon(
                  _isVisibilityOff ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isVisibilityOff = !_isVisibilityOff;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            onChanged: (String value) {
              setState(() {
                this._passwordTyped = value;
              });
            },
            obscureText: _isVisibilityOff,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Re enter your password here...",
              labelText: "Verify Password",
              suffix: IconButton(
                icon: Icon(
                  _isVisibilityOffRe ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isVisibilityOffRe = !_isVisibilityOffRe;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) {
              setState(() {
                this._passwordReTyped = value;
              });
            },
            obscureText: _isVisibilityOffRe,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () async {
              if (_isValidatedPassword(
                  _passwordTyped, _passwordReTyped, _context)) {
                await _resetPassword(_context);
              }
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _resetPassword(BuildContext _context) async {
    bool _status = await AuthController.defaultController.resetPassword(
      _emailTyped,
      _passwordReTyped,
    );
    if (_status) {
      Navigator.pop(context);
    } else {
      DefaultComponents.showMessage(
        _context,
        "Something went wrong..!\nPlease try again.",
        Icons.error_outline,
        2,
      );
      setState(() {
        _emailTyped = null;
        _codeReceived = null;
        _codeReceived = null;
        _passwordReTyped = null;
        _passwordReTyped = null;
      });
      _changeView(ResetPasswordView.EMAIL_VIEW);
    }
  }

  _checkEmailAndSendCode(BuildContext _context) async {
    bool _status =
        await AuthController.defaultController.isEmailAlreadyExist(_emailTyped);
    if (_status) {
      _codeReceived = await AuthController.defaultController
          .sendCodeToResetPassword(_emailTyped);
      _changeView(ResetPasswordView.CODE_VIEW);
    } else {
      DefaultComponents.showMessage(
        _context,
        "Email is not matched..!\nPlease re enter.",
        Icons.error_outline,
        2,
      );
    }
  }

  bool _isValidatedEmail(String _email, BuildContext _context) {
    if (_email.isEmpty) {
      DefaultComponents.showMessage(
        _context,
        "Email field is required..!",
        Icons.error_outline,
        2,
      );
      return false;
    }
    if (!RegExp(KRegEx.EMAIL_REG_EX).hasMatch(_email)) {
      DefaultComponents.showMessage(
        _context,
        "Please enter valid email..!",
        Icons.error_outline,
        2,
      );
      return false;
    }
    return true;
  }

  bool _isValidatedPassword(
      String _password, String _passwordRe, BuildContext _context) {
    if (_password.isEmpty) {
      DefaultComponents.showMessage(
        _context,
        "Password field is required..!",
        Icons.error_outline,
        2,
      );
      return false;
    }
    if (_passwordRe.isEmpty) {
      DefaultComponents.showMessage(
        _context,
        "Re enter password..!",
        Icons.error_outline,
        2,
      );
      return false;
    }
    if (_password != _passwordRe) {
      DefaultComponents.showMessage(
        _context,
        "Passwords dosen't match.\nRe enter password..!",
        Icons.error_outline,
        2,
      );
    }
    return true;
  }

  _changeView(ResetPasswordView view) {
    setState(() {
      widget._view = view;
    });
  }
}
