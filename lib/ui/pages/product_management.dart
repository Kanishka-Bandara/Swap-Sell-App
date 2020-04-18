import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/pages/product_create.dart';
import 'package:swap_sell/ui/pages/product_edit_view.dart';

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
            ProductEditView(),
            _buildProductDeleteSection(context),
            _buildProductListViewSection(context),
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
