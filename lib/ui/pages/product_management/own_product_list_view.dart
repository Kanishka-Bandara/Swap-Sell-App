import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controller/product/owner_product_list_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class OwnProductListView extends StatefulWidget {
  static const int VIEW_STATE = 5;
  static const int EDIT_STATE = 1;
  static const int DELETE_STATE = 0;
  final int _status;
  OwnProductListView(this._status);
  @override
  State<StatefulWidget> createState() {
    return _OwnProductListView(_status);
  }
}

class _OwnProductListView extends State<OwnProductListView> {
  String _filterQuery = "";
  KTextFormField _textFilterField;
  final int _status;
  _OwnProductListView(this._status);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ScopedModel(
          model: OwnerProductsController.defaultController,
          child: ScopedModelDescendant<OwnerProductsController>(
            builder: (BuildContext context, Widget widget,
                OwnerProductsController model) {
              return model.getOwnerProductsListLength() > 0
                  ? Container(
                      child: _textFilterField = KTextFormField(
                        name: "Search",
                        emptyRequiredMessage: null,
                        onChanged: (value) {
                          setState(() {
                            _filterQuery = value;
                          });
                        },
                        onSaved: (value) {},
                        suffix: _filterQuery == null || _filterQuery.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _filterQuery = "";
                                    _textFilterField.clear();
                                  });
                                },
                              ),
                        prefix: Container(
                          width: 10,
                        ),
                      ),
                    )
                  : Row();
            },
          ),
        ),
        Flexible(
          child: _buildOwnProductList(context),
        ),
      ],
    );
  }

  _buildOwnProductList(BuildContext context) {
    return ScopedModel(
      model: OwnerProductsController.defaultController,
      child: FutureBuilder(
        future: OwnerProductsController.defaultController
            .getCurrentOwnerProductList(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.data == null) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      ShimmerTile(
                          MediaQuery.of(context).size.width, 75, context),
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
            return ScopedModelDescendant<OwnerProductsController>(builder:
                (BuildContext context, Widget widget,
                    OwnerProductsController model) {
              return snapshot.data.length <= 0
                  ? DefaultComponents.buildNoDetailsWidget(context,
                      Icons.cloud_queue, "You have not added a product yet.")
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                //TODO::
                              },
                              leading: Image.network(
                                snapshot.data[index].getImages[0],
                                width: 75,
                              ),
                              title: Text(snapshot.data[index].name),
                              subtitle: Text(
                                snapshot.data[index].getDisplayRetailPrice,
                                style: TextStyle(
                                    color: Color.fromRGBO(85, 85, 85, 1)),
                              ),
                              // isThreeLine: true,
                              trailing:
                                  _status == OwnProductListView.DELETE_STATE
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.close,
                                          ),
                                          onPressed: () {
                                            model.deleteFromOwnerProductsList(
                                                snapshot.data[index], index);
                                          })
                                      : null,
                            ),
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
}
