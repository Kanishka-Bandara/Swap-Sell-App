import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingCartState();
  }
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool _useCheckBox = true;
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: ScopedModelDescendant<CartController>(
        builder: (BuildContext context, Widget widget, CartController ccModel) {
          return Scaffold(
            appBar: ApplicationBar.createNormalAppBar(
              context,
              "My Cart (${ccModel.getCartItemCount})",
              false,
              false,
              null,
              <Widget>[
                IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: ccModel.getCartTotal <= 0
                      ? null
                      : () {
                          ccModel.removeSelectedFromTheShoppingCart();
                        },
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: _buildCartList(context),
                ),
              ],
            ),
            bottomNavigationBar: buildBottomDetailsBar(context),
          );
        },
      ),
    );
  }

  _buildCartList(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: FutureBuilder(
        future: CartController.defaultController.getCartProducts,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      ShimmerTile(
                          MediaQuery.of(context).size.width, 150, context),
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
            return ScopedModelDescendant<CartController>(builder:
                (BuildContext context, Widget widget, CartController model) {
              return snapshot.data.length <= 0
                  ? DefaultComponents.buildNoDetailsWidget(
                      context,
                      Icons.remove_shopping_cart,
                      "You have not added a product yet.")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            _buildRow(context, snapshot.data[index]),
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
            });
          }
        },
      ),
    );
  }

  _buildRow(BuildContext context, UserCartProduct userCartProduct) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 500,
      child: Column(
        children: <Widget>[
          _buildShopNameTile(context, userCartProduct),
          _buildItemList(userCartProduct),
        ],
      ),
    );
  }

  _buildShopNameTile(BuildContext context, UserCartProduct userCartProduct) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
          _useCheckBox
              ? Checkbox(
                  value: userCartProduct.isAllProductSelected,
                  onChanged: (v) {
                    userCartProduct.setAllProductSelected(v);
                  },
                )
              : Switch(
                  value: userCartProduct.isAllProductSelected,
                  onChanged: (v) {
                    userCartProduct.setAllProductSelected(v);
                  },
                ),
          Text(
            userCartProduct.getShop.getShopName,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _buildItemList(UserCartProduct userCartProduct) {
    // Column(
    //   children: <Widget>[
    //     ListView.builder(
    //       itemBuilder: (BuildContext context, int index) {
    //             _buildCartItemBody(context, userCartProduct.getCartProducts[i]),
    //       },
    //       itemCount: userCartProduct.cartProducts.length,
    //     )
    //   ],
    // );
    List<Widget> a = [];
    for (var i = 0; i < userCartProduct.getCartProducts.length; i++) {
      a.add(
        _buildCartItemBody(context, userCartProduct.getCartProducts[i]),
      );
      a.add(
        Divider(
          height: 5,
        ),
      );
    }
    return Column(
      children: a,
    );
  }

  _buildCartItemBody(BuildContext context, CartProduct cartProduct) {
    Product _product = cartProduct.getProduct;
    return Container(
      child: Banner(
        layoutDirection: TextDirection.ltr,
        message: cartProduct.dealingType == ProductDealingType.ONLY_SELL
            ? "Buy"
            : "Exchange",
        location: BannerLocation.topEnd,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Row(
            children: <Widget>[
              _useCheckBox
                  ? Checkbox(
                      value: cartProduct.isSelected,
                      onChanged: (v) {
                        cartProduct.setSelected = v;
                      },
                    )
                  : Switch(
                      value: cartProduct.isSelected,
                      onChanged: (v) {
                        cartProduct.setSelected = v;
                      },
                    ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(_product.getImages[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 10,
                    ),
                    child: Container(
                      child: Text(
                        //TODO:product name
                        _product.getName.substring(0, 10),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _product.getDiscount == 0.0
                            ? Row(
                                children: <Widget>[
                                  Text(
                                    "${_product.getDisplayRetailPrice}",
                                    style: TextStyle(fontSize: 20),
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
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        // "${_product.currancy} ${_product.retailPrice}",
                                        "${_product.getDisplayRetailPrice}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        // "${_product.currancy} ${_product.retailPrice}",
                                        "-${_product.getDiscount} %",
                                        style: TextStyle(
                                            fontSize: 10,
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
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          cartProduct.addQty(-1);
                        },
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: 60,
                        height: 40,
                        child: Center(
                          child: Text(
                            "${cartProduct.getQty}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          cartProduct.addQty(1);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomDetailsBar(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: ScopedModelDescendant<CartController>(
        builder: (BuildContext context, Widget widget, CartController model) {
          return Container(
            height: 75,
            // color: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _useCheckBox
                      ? Checkbox(
                          value: model.isSelectedAll,
                          onChanged: model.getCartTotal <= 0
                              ? null
                              : (v) {
                                  model.setAllSelected(v);
                                },
                        )
                      : Switch(
                          value: model.isSelectedAll,
                          onChanged: model.getCartTotal <= 0
                              ? null
                              : (v) {
                                  model.setAllSelected(v);
                                },
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${model.getDisplayCartTotal}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _buildCheckoutButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: ScopedModelDescendant<CartController>(
        builder: (BuildContext context, Widget widget, CartController model) {
          return RaisedButton(
            onPressed: model.getCartTotal <= 0
                ? () {
                    DefaultComponents.showMessage(context,
                        "Add items to the cart to proceed checkout.", null, 2);
                  }
                : () {
                    //TODO::Checkout
                  },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.6),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 100.0),
                alignment: Alignment.center,
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
