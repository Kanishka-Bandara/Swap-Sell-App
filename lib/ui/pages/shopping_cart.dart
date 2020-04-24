import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/product/cart_controller.dart';
import 'package:swap_sell/model/cart/cart_product.dart';
import 'package:swap_sell/model/cart/user_cart_product.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/shop/shop.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "My Cart",
        false,
        false,
        null,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(),
          ),
          Flexible(
            child: _buildCartList(context),
          ),
        ],
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
          _buildShopNameTile(context, userCartProduct.getShop),
          _buildItemList(userCartProduct),
        ],
      ),
    );
  }

  _buildShopNameTile(BuildContext context, Shop shop) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
          Switch(
            value: true,
            onChanged: (v) {},
          ),
          Text(
            shop.getShopName,
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
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        children: <Widget>[
          Switch(
            value: true,
            onChanged: (v) {},
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
                image: NetworkImage(_product.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    _product.getname.substring(0, 10),
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
                    _product.getdiscount == 0.0
                        ? Row(
                            children: <Widget>[
                              Text(
                                "${_product.getdisplayRetailPrice}",
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
                                    "${_product.getdisplayDiscountedRetailPrice}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    // "${_product.currancy} ${_product.retailPrice}",
                                    "${_product.getdisplayRetailPrice}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    // "${_product.currancy} ${_product.retailPrice}",
                                    "-${_product.getdiscount} %",
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
                    onPressed: () {},
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
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
