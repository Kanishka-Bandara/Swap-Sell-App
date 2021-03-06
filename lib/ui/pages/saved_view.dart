import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/saved/saved_product_controller.dart';
import 'package:swap_sell/controller/saved/saved_searches_controller.dart';
import 'package:swap_sell/controller/saved/saved_shops_controller.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/my_menu.dart';
import 'package:swap_sell/ui/component/shimmer_tile.dart';

class SavedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedViewState();
  }
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: AppInit.currentApp,
      child: ScopedModelDescendant<AppInit>(
        builder: (BuildContext context, Widget widget, AppInit model) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: ApplicationBar.createNormalAppBar(
                context,
                "Saved",
                true,
                true,
                TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: "Searches",
                    ),
                    Tab(
                      text: "Products",
                    ),
                    Tab(
                      text: "Shops",
                    ),
                    // Tab(
                    //   text: "Users",
                    // ),
                  ],
                ),
              ),
              drawer: MyMenu.getMyMenu(context),
              body: TabBarView(
                children: <Widget>[
                  model.currentUserState
                      ? _buildSavedSearchesPage(context)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to get saved searches."),
                  model.currentUserState
                      ? _buildSavedProductsPage(context)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to get saved products."),
                  model.currentUserState
                      ? _buildSavedShopsPage(context)
                      : DefaultComponents.buildUnSignedTile(
                          context, "Please Sign in to get saved shops."),
                  // model.currentUserState
                  //     ? Center(
                  //         child: Text("Users"),
                  //       )
                  //     : DefaultComponents.buildUnSignedTile(
                  //         context, "Please Sign in to get saved users."),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildSavedShopsPage(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SavedShopsController.defaultController.getSavedList(),
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
              model: SavedShopsController.defaultController,
              child: ScopedModelDescendant<SavedShopsController>(builder:
                  (BuildContext context, Widget widget,
                      SavedShopsController model) {
                return snapshot.data.length == 0
                    ? DefaultComponents.buildNoDetailsWidget(
                        context, Icons.business, "No saved shops.")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                onTap: () {
                                  AppNavigator.navigateToProductViewPage(
                                      context, snapshot.data[index].shop);
                                },
                                leading: Image.network(
                                  snapshot.data[index].shop.getImgUrl,
                                  width: 75,
                                ),
                                title: Text(
                                  "${snapshot.data[index].shop.shopName}",
                                ),
                                subtitle: Text(
                                  "${snapshot.data[index].getSavedAt}",
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete_forever),
                                  onPressed: () async {
                                    // bool _state =
                                    await model.removeFromSavedList(
                                        snapshot.data[index], index);
                                    // if (_state) {
                                    //   setState(() {
                                    //     _searchedListCount--;
                                    //   });
                                    // }
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

  _buildSavedProductsPage(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SavedProductsController.defaultController.getSavedList(),
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
              model: SavedProductsController.defaultController,
              child: ScopedModelDescendant<SavedProductsController>(builder:
                  (BuildContext context, Widget widget,
                      SavedProductsController model) {
                return snapshot.data.length == 0
                    ? DefaultComponents.buildNoDetailsWidget(
                        context, Icons.save, "No saved products.")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                onTap: () {
                                  AppNavigator.navigateToProductViewPage(
                                      context, snapshot.data[index].product);
                                },
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
                                    // bool _state =
                                    await model.removeFromSavedList(
                                        snapshot.data[index], index);
                                    // if (_state) {
                                    //   setState(() {
                                    //     _searchedListCount--;
                                    //   });
                                    // }
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

  _buildSavedSearchesPage(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SavedSearchesController.defaultController.getSavedList(),
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
              model: SavedSearchesController.defaultController,
              child: ScopedModelDescendant<SavedSearchesController>(
                builder: (BuildContext context, Widget widget,
                    SavedSearchesController model) {
                  return snapshot.data.length == 0
                      ? DefaultComponents.buildNoDetailsWidget(
                          context, Icons.search, "No saved searches.")
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  onTap: () {
                                    AppNavigator.navigateToSearchPage(context,
                                        snapshot.data[index].getQuery, false);
                                  },
                                  leading: Icon(Icons.search),
                                  title:
                                      Text("${snapshot.data[index].getQuery}"),
                                  subtitle: Text(
                                      "${snapshot.data[index].getSavedAt}"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete_forever),
                                    onPressed: () async {
                                      // bool _state =
                                      await model.removeFromSavedList(
                                          snapshot.data[index], index);
                                      // if (_state) {
                                      //   setState(() {
                                      //     _searchedListCount--;
                                      //   });
                                      // }
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
                },
              ),
            );
          }
        },
      ),
    );
  }
}
