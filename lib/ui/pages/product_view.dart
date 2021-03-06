import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swap_sell/controller/product/cart_controller.dart';
import 'package:swap_sell/controller/product/product_controller.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:swap_sell/ui/component/default_components.dart';
import 'package:swap_sell/ui/component/product_card.dart';
import 'package:swap_sell/ui/component/shimmer_tile.dart';
import 'package:swap_sell/ui/component/text_components.dart';

class ProductView extends StatefulWidget {
  static Product currentProduct;

  @override
  State<StatefulWidget> createState() {
    return _ProductViewState(currentProduct);
  }
}

class _ProductViewState extends State<ProductView> {
  Product _product;
  double _selectedQty = 1;
  int _bottomNavigationBarCurruntIndex = 1;
  _ProductViewState(this._product);
  @override
  void initState() {
    super.initState();
  }

  // _ProductViewState(_product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
          context, "Product", true, true, null),
      // drawer: MyMenu.getMyMenu(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCarousel(_product.getnetworkImages),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        _product.getName,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      _buildRatingBar(context, _product.getRating),
                      _product.getRating == 0
                          ? Text("No ratings yet")
                          : Text(
                              _product.getSaleCount == 0
                                  ? "No orders"
                                  : _product.getSaleCount == 1
                                      ? "   ${_product.getSaleCount} order"
                                      : "   ${_product.getSaleCount} orders",
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _product.getDiscount == 0.0
                      ? Row(
                          children: <Widget>[
                            Text(
                              "${_product.getDisplayRetailPrice}",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "${_product.getDisplayDiscountedRetailPrice}",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "${_product.getDisplayRetailPrice}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "-${_product.getDiscount} %",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.deepOrange),
                                ),
                              ],
                            ),
                          ],
                        ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Theme.of(context).backgroundColor,
            ),
            _buildAboutArea(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Theme.of(context).backgroundColor,
            ),
            _buildShippingArea(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Theme.of(context).backgroundColor,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextComponents.h1(context, "Similar Products"),
              ),
            ),
            _buildSimilarProductsList(context, _product),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              color: Theme.of(context).backgroundColor,
            ),
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildCarousel(List<Image> images) {
    return new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: images,
        overlayShadowColors: Colors.transparent,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        onImageTap: (_) {
          _showCarouselModel(context, images, _);
        },
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
        showIndicator: false,
      ),
    );
  }

  _showCarouselModel(
      BuildContext context, List<Image> images, int defaultImage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  defaultImage: images[defaultImage],
                  images: images,
                  autoplay: false,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  // dotSize: 4.0,
                  // indicatorBgPadding: 6.0,
                  showIndicator: false,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: DefaultComponents.buildRoundedContainer(
                  context,
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Theme.of(context).primaryColor.withOpacity(0.9),
                  50,
                  50,
                  50,
                ),
              )
            ],
          ),
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
      },
    );
  }

  Widget _generateDetailsTable() {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey[200], width: 0.5)),
      columnWidths: Map.from(
        {
          0: FixedColumnWidth(150.0),
          // 1: new FixedColumnWidth(180.0),
          // 2: new FixedColumnWidth(100.0)
        },
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "Condition",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(ProductConditionController.defaultController
                    .getNameByIndex(_product.getCondition))),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "Can Buy",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                _product.canOnlySell || _product.canBarterAndSell
                    ? "Yes"
                    : "No",
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "Can Barter",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                _product.canOnlyBarter || _product.canBarterAndSell
                    ? "Yes"
                    : "No",
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Quantity",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("${_product.getQty.round()} available")),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Brand",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(_product.getBrand)),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                "Model",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(_product.getModel)),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBar(BuildContext context, double rating) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }

  List<Widget> _getSpecificationList() {
    List<Widget> a = new List(_product.getSpecifications.length);
    int i = 0;
    _product.getSpecifications.forEach((k, v) {
      a[i] = Row(
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width - 20) / 2,
            height: 30,
            child: Text(
              k,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            width: 100,
            height: 30,
            child: Text(v),
          ),
        ],
      );
      i++;
    });
    return a;
  }

  Widget _buildAboutArea() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "About This Product",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          _generateDetailsTable(),
          Row(
            children: <Widget>[
              Text("Select Qty"),
              Slider.adaptive(
                value: _selectedQty,
                min: 1,
                max: _product.getQty.round().toDouble(),
                divisions: _product.getQty,
                label: "${_selectedQty.toInt()}",
                onChanged: (double v) {
                  setState(() {
                    _selectedQty = v;
                  });
                },
              ),
              Text(
                "${_selectedQty.toInt()}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _product.getSpecifications.length != 0
              ? ExpansionTile(
                  title: Text("Specifications"),
                  children: _getSpecificationList(),
                )
              : SizedBox(
                  height: 10,
                ),
          ExpansionTile(
            title: Text("Description"),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      _product.getDescription,
                      style: TextStyle(fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShippingArea() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Shipping, Returns & Payments",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 20) / 3,
                    child: Text(
                      "Shipping",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    // width: (MediaQuery.of(context).size.width - 20) /3* 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Economy International Shipping"),
                        Text(
                          "From Sri Lanka",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 20) / 3,
                    child: Text(
                      "Returns",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    // width: (MediaQuery.of(context).size.width - 20) /3* 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Accepted withing 30 days"),
                        Text(
                          "Buyer pays return shipping",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 20) / 3,
                    child: Text(
                      "Payments",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    ),
                  ),
                  Container(
                    // width: (MediaQuery.of(context).size.width - 20) /3* 2,
                    child: Row(
                      children: <Widget>[Icon(Icons.payment)],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSimilarProductsList(BuildContext context, Product p) {
    return Container(
      height: 310,
      child: FutureBuilder(
        future: ProductController.defaultController.getSimilarProducts(p),
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

  _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: _bottomNavigationBarCurruntIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          title: Text("Shop"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          title: Text("Add"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          title: Text("Buy Now"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            _product.getIsFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          title: Text("Save"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      onTap: (index) {
        _bottomNavigationBarCurruntIndex = index;

        if (index == 0) {
          //Shop
        }
        if (index == 1) {
          showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _product.canOnlySell || _product.canBarterAndSell
                        ? CupertinoButton(
                            onPressed: () async {
                              bool _status = await CartController
                                  .defaultController
                                  .addToCartProduct(
                                CartProduct(
                                  id: 0,
                                  product: _product,
                                  isSelected: false,
                                  qty: _selectedQty.toInt(),
                                  dealingType: ProductDealingType.ONLY_SELL,
                                  addedDate: DateTime.now(),
                                  status: 1,
                                ),
                              );
                              Navigator.of(context).pop();
                              if (_status) {
                                DefaultComponents.showToast(
                                  "Product has been added to the cart.",
                                  false,
                                );
                              } else {
                                DefaultComponents.showToast(
                                  "Something went wrong.\nPlease try again.",
                                  true,
                                );
                              }
                            },
                            child: Text("Buy"),
                          )
                        : Container(),
                    _product.canOnlyBarter || _product.canBarterAndSell
                        ? CupertinoButton(
                            onPressed: () async {
                              bool _status = await CartController
                                  .defaultController
                                  .addToCartProduct(
                                CartProduct(
                                  id: 0,
                                  product: _product,
                                  isSelected: false,
                                  qty: _selectedQty.toInt(),
                                  dealingType: ProductDealingType.ONLY_BARTER,
                                  addedDate: DateTime.now(),
                                  status: 1,
                                ),
                              );
                              Navigator.of(context).pop();
                              if (_status) {
                                DefaultComponents.showToast(
                                  "Product has been added to the cart.",
                                  false,
                                );
                              } else {
                                DefaultComponents.showToast(
                                  "Something went wrong.\nPlease try again.",
                                  true,
                                );
                              }
                            },
                            child: Text("Exchange"),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          );
        }
        if (index == 2) {
          //Buy Now
        }
        if (index == 3) {
          //Save
          // setState(() {
          // _product.isFavorite = !_product.isFavorite;
          // });
        }
        setState(() {
          _bottomNavigationBarCurruntIndex = index;
        });
      },
    );
  }
}
