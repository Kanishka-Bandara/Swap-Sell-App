import 'package:flutter/material.dart';
import 'package:swap_sell/controllers/product/product_controller.dart';
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
    return _OwnProductListView();
  }
}

class _OwnProductListView extends State<OwnProductListView> {
  String _filterQuery = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: KTextFormField(
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
                : IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            prefix: Container(
              width: 10,
            ),
          ),
        ),
        Flexible(
          child: _buildOwnProductList(context),
        ),
      ],
    );
  }

  _buildOwnProductList(BuildContext context) {
    return FutureBuilder(
      future: ProductController.defaultController.getOwnerProductList(null),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    ShimmerTile(MediaQuery.of(context).size.width, 75, context),
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
          return ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      //TODO::
                    },
                    leading: Image.network(
                      snapshot.data[index].images[0],
                      width: 75,
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(
                      "Rs " + snapshot.data[index].retailPrice.toString(),
                      style: TextStyle(color: Color.fromRGBO(85, 85, 85, 1)),
                    ),
                    // isThreeLine: true,
                    trailing: widget._status == OwnProductListView.DELETE_STATE
                        ? IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: () {})
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
        }
      },
    );
  }
}
