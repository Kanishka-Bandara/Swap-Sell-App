import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';

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
      body: Center(
        child: Text("Shopping Cart"),
      ),
      appBar: ApplicationBar.createNormalAppBar(context, "Shopping Cart"),
    );
  }
}
