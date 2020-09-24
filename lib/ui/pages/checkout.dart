import 'package:flutter/material.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/product/cart_controller.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/component/app_bar.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "CheckOut",
        false,
        false,
        null,
        null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderRow(context, "Ship To :"),
            _buildShippingAddressArea(context),
            _buildHeaderRow(context, "Pay With :"),
            _buildPaymentArea(context),
            _buildHeaderRow(context, "Product Count"),
            _buildProductCountArea(context),
            _buildHeaderRow(context, "Bill"),
            _buildBillArea(context),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.all(10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: RaisedButton(
                child: Text(
                  "CONFIRM & PAY",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context, String s) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.all(10),
      color: Theme.of(context).primaryColorDark,
      child: Text(
        s,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }

  Widget _buildShippingAddressArea(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 150,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "AppInit.currentApp.getCurrentUser.getAddresses[0].getAsString",
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 150,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentArea(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 100,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Visa * x-1639",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "LKR 10709.00",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "",
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 100,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCountArea(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Table(
                border: TableBorder.all(
                  color: Colors.black26,
                  width: 1,
                  style: BorderStyle.none,
                ),
                children: <TableRow>[
                  _buildTableRow(context, "Buying Count",
                      "${CartController.defaultController.getSelectedBuyingCartProductQty}"),
                  _buildTableRow(context, "Exchanging pair Count",
                      "${CartController.defaultController.getSelectedBarterCartProductQty}"),
                  _buildTableRow(context, "Total Count",
                      "${CartController.defaultController.getSelectedCartProductQty}"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBillArea(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          // height: 120,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Table(
                border: TableBorder.all(
                  color: Colors.black26,
                  width: 1,
                  style: BorderStyle.none,
                ),
                children: <TableRow>[
                  _buildTableRow(context, "Exchanging(Taken) Total",
                      "${CartController.defaultController.getSelectedCartProductsTotalDisplay(ProductDealingType.ONLY_BARTER)}"),
                  _buildTableRowBreaker(context, null),
                  _buildTableRow(context, "Exchanging(Granted) Total",
                      "- ${CartController.defaultController.getSelectedOwnerExchangingCartProductsTotalDisplay}"),
                  _buildTableRowBreaker(context, null),
                  _buildTableRow(context, "Exchanging Difference",
                      "= ${CartController.defaultController.getSelectedExchangingCartProductsDifferenceDisplay}"),
                  _buildTableRowBreaker(
                      context, Theme.of(context).primaryColor),
                  _buildTableRow(context, "Buying Total",
                      "${CartController.defaultController.getSelectedCartProductsTotalDisplay(ProductDealingType.ONLY_SELL)}"),
                  _buildTableRowBreaker(context, null),
                  _buildTableRow(context, "Exchanging Difference",
                      "+ ${CartController.defaultController.getSelectedExchangingCartProductsDifferenceDisplay}"),
                  _buildTableRowBreaker(context, null),
                  _buildTableRow(context, "Total payable",
                      "= ${CartController.defaultController.getTotalPayableDisplay}"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildTableRow(BuildContext context, String s, String e) {
    return TableRow(
      children: [
        TableCell(
          child: Text(
            s,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TableCell(
          child: Text(
            ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TableCell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                e,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildTableRowBreaker(BuildContext context, Color color) {
    return TableRow(
      children: <Widget>[
        TableCell(
          child: Container(
            height: 1,
            color: color,
            margin: EdgeInsets.only(
              top: 2,
              bottom: 2,
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: 1,
            color: color,
            margin: EdgeInsets.only(
              top: 2,
              bottom: 2,
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: 1,
            color: color,
            margin: EdgeInsets.only(
              top: 2,
              bottom: 2,
            ),
          ),
        ),
      ],
    );
  }
}
