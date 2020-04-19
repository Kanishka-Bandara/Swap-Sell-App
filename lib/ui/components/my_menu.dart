import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';

class MyMenu {
  static getMyMenu(BuildContext context) {
    return ScopedModel(
      model: AppInit.currentApp,
      child: Drawer(
        child: SingleChildScrollView(
          child: ScopedModelDescendant<AppInit>(
              builder: (BuildContext context, Widget child, AppInit model) {
            return Column(
              children: <Widget>[
                model.currentUserState
                    ? _buildUserAccount()
                    : _buildSignInTile(context),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    AppNavigator.navigateToHomePage(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  onTap: () {
                    AppNavigator.navigateToNotificationViewPage(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Messages"),
                  onTap: () {
                    AppNavigator.navigateToMessageViewPage(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 36,
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Saved"),
                  onTap: () {
                    AppNavigator.navigateToSavedViewPage(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image_aspect_ratio),
                  title: Text("Product Management"),
                  onTap: () {
                    AppNavigator.navigateToProductManagementPage(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_mall),
                  title: Text("Purchases"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.flag),
                  title: Text("Offers"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.local_offer),
                  title: Text("Selling"),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  height: 36,
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text("Categorries"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help"),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.black,
                  height: 36,
                ),
                ListTile(
                  leading: Icon(Icons.perm_identity),
                  title: Text("Profile"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign Out"),
                  onTap: () {
                    model.logOut();
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  static _buildUserAccount() {
    return ScopedModel(
      model: AppInit.currentApp,
      child: ScopedModelDescendant<AppInit>(
        builder: (BuildContext context, Widget widget, AppInit model) {
          return UserAccountsDrawerHeader(
            currentAccountPicture:
                model.getCurrentUser.getProfilePicUrl == null ||
                        model.getCurrentUser.getProfilePicUrl.isEmpty
                    ? Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Colors.white,
                      )
                    : Container(
                        width: 100.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              model.getCurrentUser.getProfilePicUrl,
                            ),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
            accountName: Text(model.getCurrentUser.getFName +
                " " +
                model.getCurrentUser.getLName),
            accountEmail: Text(model.getCurrentUser.getEmails[0].getEmail),
          );
        },
      ),
    );
  }

  static _buildSignInTile(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 170,
      padding: EdgeInsets.only(top: 30, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Sign up"),
                    onPressed: () {
                      AppNavigator.navigateToSignUpPage(context);
                    },
                  ),
                  RaisedButton(
                    child: Text("Sign in"),
                    onPressed: () {
                      AppNavigator.navigateToSignInPage(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
