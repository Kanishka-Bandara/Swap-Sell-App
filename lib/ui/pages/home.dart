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
              _buildCategoryList(context),
              Container(
                height: 20,
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
      height: 120,
      child: FutureBuilder(
        future: ProductController.getMainCategoryList(),
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
                  ShimmerTile(MediaQuery.of(context).size.width, 120, context),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.network(
                      snapshot.data[index].getImgPath,
                      width: 60,
                      height: 100,
                    ),
                    Text(snapshot.data[index].getCatName),
                  ],
                );
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
        future: ProductController.getRecentArrivedProductList(),
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
        future: ProductController.getHighestSoldProductList(),
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
