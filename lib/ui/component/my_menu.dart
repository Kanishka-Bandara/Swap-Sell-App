import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/config/paypal/PaypalPayment.dart';
import 'package:swap_sell/controller/message_controlller.dart';
import 'package:swap_sell/controller/notification_controller.dart';
import 'package:swap_sell/sample_data/product_controller_delete.dart';
import 'package:swap_sell/ui/component/default_components.dart';

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
                  trailing: ScopedModel(
                    model: NotificationController.currentController,
                    child: ScopedModelDescendant<NotificationController>(
                      builder: (BuildContext context, Widget widget,
                          NotificationController nModel) {
                        return nModel.getUnreadNotificationCount > 0
                            ? DefaultComponents.buildRoundedNotificationLabel(
                                context,
                                "${nModel.getUnreadNotificationCount}",
                                Theme.of(context).primaryColor,
                                30,
                                30,
                                50,
                              )
                            : Text("");
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Messages"),
                  onTap: () {
                    AppNavigator.navigateToMessageViewPage(context);
                  },
                  trailing: ScopedModel(
                    model: MessageController.defaultMessageController,
                    child: ScopedModelDescendant<MessageController>(
                      builder: (BuildContext context, Widget widget,
                          MessageController msgModel) {
                        return msgModel.getAllUnreadMessagesCount > 0
                            ? DefaultComponents.buildRoundedNotificationLabel(
                                context,
                                "${msgModel.getAllUnreadMessagesCount}",
                                Theme.of(context).primaryColor,
                                30,
                                30,
                                50,
                              )
                            : Text("");
                      },
                    ),
                  ),
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
                  onTap: () async {
                    ProductControllerDelete.loadAsset();
                    print("=====================================");
                    await ProductControllerDelete.loadMainProductList();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.flash_on),
                  title: Text("Wish List"),
                  onTap: () {
                    AppNavigator.navigateToWishListViewPage(context);
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.local_offer),
                //   title: Text("Selling"),
                //   onTap: () {},
                // ),
                Divider(
                  color: Colors.black,
                  height: 36,
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text("Categorries"),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PaypalPayment(
                          onFinish: (number) async {
                            // payment done
                            print("========================================");
                            print('order id: ' + number);
                          },
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    AppNavigator.navigateToSettingsPage(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help"),
                  onTap: () {},
                ),
                model.currentUserState
                    ? Divider(
                        color: Colors.black,
                        height: 36,
                      )
                    : Container(),
                model.currentUserState
                    ? ListTile(
                        leading: Icon(Icons.perm_identity),
                        title: Text("Profile"),
                        onTap: () {
                          Navigator.of(context).pop();
                          AppNavigator.navigateToProfileOverviewPage(context);
                        },
                      )
                    : Container(),
                model.currentUserState
                    ? ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text("Sign Out"),
                        onTap: () {
                          model.logOut();
                        },
                      )
                    : Container(),
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
            accountEmail: Text(
              model.getCurrentUser.getUserId,
            ),
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
