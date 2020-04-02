import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/ui/widgets/icons.dart';

class ApplicationBar {
  static createHomeAppBar(BuildContext context) {
    return AppBar(
      title: Text('Swap&Sell'),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          child: AppIcons.createShoppingCart(context, "0"),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size(1000, 60),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 50,
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(Routes.ROUTES_SEARCHPAGE);
                  AppNavigator.navigateToSearchPage(context);
                },
                child: Text(
                  "Search for anything",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static createSearchAppBar(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        TextField(),
        IconButton(
          icon: Icon(Icons.camera_alt),
          color: Colors.grey,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.mic),
          color: Colors.grey,
          onPressed: () {},
        )
      ],
    );
  }

//   static createSearchAppBar(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       bottom: PreferredSize(
//         preferredSize: Size(1000, 20),
//         child: Container(
//           margin: EdgeInsets.all(10),
//           height: 50,
//           color: Colors.white,
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ButtonBar(
//                 children: <Widget>[
//                   IconButton(
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {},
//                   )
//                 ],
//               ),
// // TextFormField(initialValue: "Search",),
//               // GestureDetector(
//               //   onTap: () {
//               //     // Navigator.of(context).pushNamed(Routes.ROUTES_SEARCHPAGE);
//               //   },
//               //   child:
//               //    Text(
//               //     "Search for anything",
//               //     style: TextStyle(fontSize: 20, color: Colors.grey),
//               //   ),
//               // ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(
//                         Icons.mic,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.camera_alt,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // backgroundColor: Colors.white,
//     );
//   }

  static createNormalAppBar(
      BuildContext context, String title, bool showShoppingCart) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    AppNavigator.navigateToSearchPage(context);
                  }),
             showShoppingCart? AppIcons.createShoppingCart(context, "0"):Column(),
            ],
          ),
        )
      ],
    );
  }

  static int _productPageBottomNavigationBarCurruntIndex;

  static createProductPageBottomNavigationBar(BuildContext context) {
    _productPageBottomNavigationBarCurruntIndex = 2;
    return BottomNavigationBar(
      currentIndex: _productPageBottomNavigationBarCurruntIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text("Shop")),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart), title: Text("Add")),
        BottomNavigationBarItem(
            icon: Icon(Icons.check), title: Text("Buy Now")),
      ],
      onTap: (index) {
        _productPageBottomNavigationBarCurruntIndex = index;
        // setS
      },
    );
  }
}
