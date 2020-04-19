import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/pages/product_management/own_product_list_view.dart';
import 'package:swap_sell/ui/pages/product_management/product_create.dart';

class ProductManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagementState();
  }
}

class _ProductManagementState extends State<ProductManagement> {
  final GlobalKey<FormState> _formKeyEdit = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ApplicationBar.createNormalAppBar(
          context,
          "Product Management",
          false,
          true,
          TabBar(
            tabs: <Widget>[
              Tab(
                text: "Create",
              ),
              Tab(
                text: "Edit",
              ),
              Tab(
                text: "Delete",
              ),
              Tab(
                text: "View",
              ),
            ],
          ),
        ),
        drawer: MyMenu.getMyMenu(context),
        body: TabBarView(
          children: <Widget>[
            ProductCreate(),
            OwnProductListView(OwnProductListView.EDIT_STATE),
            OwnProductListView(OwnProductListView.DELETE_STATE),
            OwnProductListView(OwnProductListView.VIEW_STATE),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCreateSection(BuildContext context) {
    //TODO:Finish _buildProductCreateSection
  }

  Widget _buildProductEditSection(BuildContext context) {
    //TODO:Finish _buildProductEditSection
    return Center(
      child: Text("Product Edit"),
    );
  }

  Widget _buildProductDeleteSection(BuildContext context) {
    //TODO:Finish _buildProductDeleteSection
    return Center(
      child: Text("Product Delete"),
    );
  }

  Widget _buildProductListViewSection(BuildContext context) {
    //TODO:Finish _buildProductListViewSection
    return Center(
      child: Text("Product List"),
    );
  }
}
