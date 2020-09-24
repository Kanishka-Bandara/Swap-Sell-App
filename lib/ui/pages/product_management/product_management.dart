import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/my_menu.dart';
import 'package:swap_sell/ui/pages/product_management/own_product_list_view.dart';
import 'package:swap_sell/ui/pages/product_management/product_create.dart';

class ProductManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagementState();
  }
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ApplicationBar.createNormalAppBar(
          context,
          "Product Management",
          false,
          true,
          TabBar(
            tabs: <Widget>[
              Tab(
                text: "Create",
              ),
              Tab(
                text: "Edit",
              ),
              Tab(
                text: "Delete",
              ),
              Tab(
                text: "View",
              ),
            ],
          ),
        ),
        drawer: MyMenu.getMyMenu(context),
        body: ScopedModel(
          model: AppInit.currentApp,
          child: ScopedModelDescendant<AppInit>(
            builder: (BuildContext context, Widget widget, AppInit model) {
              return TabBarView(
                children: <Widget>[
                  model.currentUserState
                      ? ProductCreate()
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your products."),
                  model.currentUserState
                      ? OwnProductListView(OwnProductListView.EDIT_STATE)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your products."),
                  model.currentUserState
                      ? OwnProductListView(OwnProductListView.DELETE_STATE)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your products."),
                  model.currentUserState
                      ? OwnProductListView(OwnProductListView.VIEW_STATE)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your products."),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
