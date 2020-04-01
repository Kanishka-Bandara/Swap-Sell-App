import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/config/routs.dart';
import 'package:swap_sell/controllers/product/product_controller_delete.dart';
import 'package:swap_sell/model/product/product.dart';

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
                    Navigator.of(context).pushNamed(Routes.ROUTES_HOME);
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
                    Product p = ProductControllerDelete.mainList[0];
                    print(p);
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 36,
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Saved"),
                  onTap: () {},
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
    return UserAccountsDrawerHeader(
      currentAccountPicture: Icon(
        Icons.account_circle,
        size: 80,
        color: Colors.white,
      ),
      accountName: Text("Kanishka Bandara"),
      accountEmail: Text("wmkubandara@gmail.com"),
    );
    // AppBar(
    //   automaticallyImplyLeading: false,
    //   leading: Icon(Icons.verified_user),
    //   title: Text("Kanishka"),
    // ),
    // Container(
    //   color: Colors.green,
    //   height: 170,
    //   padding: EdgeInsets.only(top: 30, left: 20),
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Icon(
    //             Icons.account_circle,
    //             size: 100,
    //             color: Colors.white,
    //           )
    //         ],
    //       ),
    //       Row(
    //         children: <Widget>[
    //           SizedBox(
    //             height: 35,
    //           ),
    //           Text(
    //             "Kanishka Bandara",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
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
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(Routes.ROUTES_SIGNIN);
                    },
                  ),
                  RaisedButton(
                    child: Text("Sign in"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(Routes.ROUTES_SIGNIN);
                    },
                  ),
                ],
              )
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     SizedBox(
          //       height: 35,
          //     ),
          //     Text(
          //       "Kanishka Bandara",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
