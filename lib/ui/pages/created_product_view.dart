import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CreatedProductView extends StatefulWidget {
  static Product currentProduct;
  static List<File> images;

  @override
  State<StatefulWidget> createState() {
    return _CreatedProductViewState(currentProduct, images);
  }
}

class _CreatedProductViewState extends State<CreatedProductView> {
  Product _product;
  List<FileImage> _images;
  Map<String, String> _specifications;
  double _selectedQty = 1;
  int _bottomNavigationBarCurruntIndex = 1;
  _CreatedProductViewState(
    this._product,
    List<File> imagesFiles,
  ) {
    _images = [];
    if (imagesFiles != null) {
      imagesFiles.forEach((File f) {
        _images.add(FileImage(f));
        print(f.path);
      });
    }
    _product.setSpecifications = _specifications;
  }
  @override
  void initState() {
    super.initState();
  }

  // _ProductViewState(_product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
          context, "Product View", false, false, null),
      // drawer: MyMenu.getMyMenu(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCarousel(_images),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    direction: Axis.vertical,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Text(
                              _product.getName == null ||
                                      _product.getName.isEmpty
                                  ? "Your product name will be shown here."
                                  : _product.getName,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
                            )
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
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildCarousel(List<FileImage> images) {
    return images == null || images.length == 0
        ? Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 50,
            child: Center(
              child: Text(
                "Your product images will be shown here when you selected them.",
              ),
            ),
          )
        : Container(
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
      BuildContext context, List<FileImage> images, int defaultImage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: images == null || images.length == 0
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Your product images will be shown here when you selected them.",
                    ),
                  ),
                )
              : Container(
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
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
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
              child: Text(
                _product.getCondition == null
                    ? "Define whether your product is used or not."
                    : ProductConditionController.defaultController
                        .getNameByIndex(_product.getCondition),
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
              child: Text(_product.getBrand == null || _product.getBrand.isEmpty
                  ? "Define your product brand."
                  : _product.getBrand),
            ),
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
              child: Text(_product.getModel == null || _product.getModel.isEmpty
                  ? "Define your product model."
                  : _product.getModel),
            ),
          ],
        ),
      ],
    );

    // DataTable(
    //   columns: [
    //     DataColumn(
    //       numeric: false,
    //       label: Text(""),
    //     ),
    //     DataColumn(
    //       label: Text(""),
    //     )
    //   ],
    //   rows: [
    //     DataRow(cells: [
    //       DataCell(
    //         Text("data"),
    //       ),
    //       DataCell(
    //         Text("data"),
    //       ),
    //     ]),
    //   ],
    // );
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
    if (_product.getSpecifications == null) {
      _product.setSpecifications = Map();
    }
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
              _product.getQty > 0
                  ? Slider.adaptive(
                      value: _selectedQty,
                      min: 1,
                      max: _product.getQty.round().toDouble(),
                      divisions: _product.getQty,
                      label: "${_selectedQty.toInt()}",
                      onChanged: (double v) {
                        print("${v.toInt()}");
                        setState(
                          () {
                            _selectedQty = v;
                          },
                        );
                      },
                    )
                  : Text("Product is unavailable."),
              Text(
                "${_selectedQty.toInt()}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          (_product.getSpecifications == null ||
                  _product.getSpecifications.length != 0)
              ? ExpansionTile(
                  title: Text("Specifications"),
                  children: _getSpecificationList(),
                )
              : ExpansionTile(
                  title: Text("Specifications"),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Define all of your product specifications as a key and a value pair.",
                        ),
                      ),
                    ),
                  ],
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
                      _product.getDescription == null ||
                              _product.getDescription.isEmpty
                          ? "Define some details of your product."
                          : _product.getDescription,
                      style: TextStyle(fontStyle: FontStyle.normal),
                    ),
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
          //Add to Product Card

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
