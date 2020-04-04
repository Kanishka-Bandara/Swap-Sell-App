import 'package:flutter/material.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';

class SavedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedViewState();
  }
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ApplicationBar.createNormalAppBar(
          context,
          "Saved",
          true,
          TabBar(
            tabs: <Widget>[
              Tab(
                text: "Searches",
              ),
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Sellers",
              ),
            ],
          ),
        ),
        drawer: MyMenu.getMyMenu(context),
        body: TabBarView(
          children: <Widget>[
            _buildSavedSearchesPage(context),
            Center(
              child: Text("Products"),
            ),
            Center(
              child: Text("Sellers"),
            ),
          ],
        ),
      ),
    );
  }

  _buildSavedSearchesPage(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.archive),
              title: Text("Title"),
              subtitle: Text("Sub Title"),
              trailing:
                  IconButton(icon: Icon(Icons.delete_sweep), onPressed: () {}),
              onTap: () {},
            ),
            Divider(
              height: 0,
            ),
          ],
        );
      },
      itemCount: 5,
    );
  }
}
