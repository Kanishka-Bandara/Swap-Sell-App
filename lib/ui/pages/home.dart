import 'package:flutter/material.dart';
import 'package:swap_sell/controllers/product/product_controller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/components/product_card.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';
import 'package:swap_sell/ui/components/text_components.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createHomeAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(10),
              // ),
              Container(
                height: 10,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              _buildCategoryList(context),
              Container(
                height: 10,
                color: Theme.of(context).backgroundColor,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextComponents.h1(context, "Recent Arrivels"),
                ),
              ),
              _buildRecentArrivedProductList(context),
              Container(
                height: 20,
                color: Theme.of(context).backgroundColor,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextComponents.h1(context, "Highest Sold"),
                ),
              ),
              _buildHighestSoldProductList(context),
            ],
          ),
        ),
      ),
      drawer: MyMenu.getMyMenu(context),
    );
  }

  _buildCategoryList(BuildContext context) {
    return Container(
      height: 50,
      child: FutureBuilder(
        future: ProductController.defaultController.getMainCategoryList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            // return Container(
            //   child: Center(
            //     child: Spinner.getSpinner(context, 15),
            //   ),
            // );
            return Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child:
                  ShimmerTile(MediaQuery.of(context).size.width, 50, context),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        blurRadius: 6,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  // width: 100,
                  height: 30,
                  child: Center(
                    child: Text(snapshot.data[index].getCatName,style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                );

                // return Column(
                //   children: <Widget>[
                //     Image.network(
                //       snapshot.data[index].getImgPath,
                //       width: 60,
                //       height: 100,
                //     ),
                //     Text(snapshot.data[index].getCatName),
                //   ],
                // );
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
    );
  }

  Widget _buildRecentArrivedProductList(BuildContext context) {
    return Container(
      height: 310,
      child: FutureBuilder(
        future: ProductController.defaultController.getRecentArrivedProductList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            // return Container(
            //   child: Center(
            //     child: Spinner.getSpinner(context, 15),
            //   ),
            // );
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child:
                  ShimmerTile(MediaQuery.of(context).size.width, 310, context),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
    );
  }

  Widget _buildHighestSoldProductList(BuildContext context) {
    return Container(
      height: 310,
      child: FutureBuilder(
        future: ProductController.defaultController.getHighestSoldProductList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            // return Container(
            //   child: Center(
            //     child: Spinner.getSpinner(context, 15),
            //   ),
            // );
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child:
                  ShimmerTile(MediaQuery.of(context).size.width, 310, context),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCard(snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      ),
    );
  }
}
