import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/product/wish_list_controller.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/my_menu.dart';
import 'package:swap_sell/ui/component/shimmer_tile.dart';

class WishListView extends StatefulWidget {
  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: AppInit.currentApp,
      child: ScopedModelDescendant<AppInit>(
        builder: (BuildContext context, Widget widget, AppInit model) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: ApplicationBar.createNormalAppBar(
                context,
                "Saved",
                true,
                true,
                TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: "Wish List",
                    ),
                    Tab(
                      text: "Wish List Notifications",
                    ),
                  ],
                ),
              ),
              drawer: MyMenu.getMyMenu(context),
              body: TabBarView(
                children: <Widget>[
                  model.currentUserState
                      ? _buildWishListProductsList(context)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your wish list"),
                  model.currentUserState
                      ? _buildWishListNotificationsList(context)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to manage your wish list"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildWishListProductsList(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: WishListProductsController.defaultController.getSavedWishList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // padding: EdgeInsets.only(),
                  child: Column(
                    children: <Widget>[
                      ShimmerTile(
                          MediaQuery.of(context).size.width, 75, context),
                      Divider(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
            );
          } else {
            return ScopedModel(
              model: WishListProductsController.defaultController,
              child: ScopedModelDescendant<WishListProductsController>(builder:
                  (BuildContext context, Widget widget,
                      WishListProductsController model) {
                return snapshot.data.length == 0
                    ? DefaultComponents.buildNoDetailsWidget(
                        context,
                        Icons.flash_on,
                        "You have not added products to the wish list.")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                onTap: () {},
                                leading: Image.network(
                                  snapshot.data[index].product.images[0],
                                  width: 75,
                                ),
                                title: Text(
                                  "${snapshot.data[index].product.name}",
                                ),
                                subtitle: Text(
                                  "${snapshot.data[index].getSavedAt}",
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete_forever),
                                  onPressed: () async {
                                    await model.removeFromSavedWishList(
                                        snapshot.data[index], index);
                                  },
                                ),
                              ),
                              Divider(
                                height: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          );
                        },
                        itemCount: snapshot.data.length,
                      );
              }),
            );
          }
        },
      ),
    );
  }

  _buildWishListNotificationsList(BuildContext context) {
    return Center(
      child: Text("Wish List"),
    );
  }
}
