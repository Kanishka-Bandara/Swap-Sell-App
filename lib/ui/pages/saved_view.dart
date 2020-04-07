import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/saved/saved_product_controller.dart';
import 'package:swap_sell/controllers/saved/saved_searches_controller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';

class SavedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedViewState();
  }
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ApplicationBar.createNormalAppBar(
          context,
          "Saved",
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
              Tab(
                text: "Users",
              ),
            ],
          ),
        ),
        drawer: MyMenu.getMyMenu(context),
        body: TabBarView(
          children: <Widget>[
            _buildSavedSearchesPage(context),
            _buildSavedProductsPage(context),
            Center(
              child: Text("Shops"),
            ),
            Center(
              child: Text("Users"),
            ),
          ],
        ),
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
                                  icon: Icon(Icons.favorite_border),
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
              child: ScopedModelDescendant<SavedSearchesController>(builder:
                  (BuildContext context, Widget widget,
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
                                  AppNavigator.navigateToSearchPage(
                                      context, snapshot.data[index].getQuery);
                                },
                                leading: Icon(Icons.search),
                                title: Text("${snapshot.data[index].getQuery}"),
                                subtitle:
                                    Text("${snapshot.data[index].getSavedAt}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.close),
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
}
