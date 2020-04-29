import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';
import 'package:swap_sell/controllers/product/owner_product_list_controller.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';

class Preparation extends StatefulWidget {
  @override
  _PreparationState createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: ScopedModelDescendant<CartController>(
        builder: (BuildContext context, Widget widget, CartController ccModel) {
          return Scaffold(
            appBar: ApplicationBar.createNormalAppBar(
              context,
              "Preparation for Check Out (${ccModel.selectedCartProductCount})",
              false,
              false,
              null,
              null,
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: _buildCartList(context),
                ),
              ],
            ),
            bottomNavigationBar: _buildBottomDetailsBar(context),
          );
        },
      ),
    );
  }

  _buildCartList(BuildContext context) {
    return ScopedModel(
      model: CartController.defaultController,
      child: FutureBuilder(
        future: CartController.defaultController.getSelectedCartProducts,
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
      padding: EdgeInsets.all(5),
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 150,
          padding: EdgeInsets.only(left: 5),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_product.getImages[0]),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        _product.getName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 5,
                        softWrap: true,
                      ),
                    ],
                  ),
                  _product.getDiscount == 0.0
                      ? Row(
                          children: <Widget>[
                            Text(
                              "${_product.getDisplayRetailPrice}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Text(
                              // "${_product.currancy} ${_product.retailPrice}",
                              "${_product.getDisplayDiscountedRetailPrice}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Qty = ${cartProduct.getQty}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Sub Tot. = ${cartProduct.getBuyingTotalDisplay}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          width: 1.0,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          margin: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 25,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2 - 15,
          height: 150,
          // padding: EdgeInsets.only(left: 5),
          child: cartProduct.getProductDealingType ==
                  ProductDealingType.ONLY_SELL
              ? Column(
                  children: <Widget>[],
                )
              : (cartProduct.getExchangingProduct == null)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Select Your Exchange Product",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RaisedButton(
                            child: Text(
                              "Select",
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                child: AlertDialog(
                                  content: Column(
                                    children: <Widget>[
                                      ListView.builder(
                                          itemCount: OwnerProductsController
                                              .defaultController
                                              .getExchangableOwnerProducts
                                              .length,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            Product _p = OwnerProductsController
                                                    .defaultController
                                                    .getExchangableOwnerProducts[
                                                index];
                                            return ListTile(
                                              leading: Image.network(
                                                _p.getImages[0],
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: <Widget>[],
                    ),
        )
      ],
    );
  }

  _buildBottomDetailsBar(BuildContext context) {
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
                    AppNavigator.navigateToCheckOut(context);
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
