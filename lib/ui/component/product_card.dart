import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/model/product/product.dart';

class ProductCard extends StatelessWidget {
  final Product _p;
  ProductCard(this._p);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            AppNavigator.navigateToProductViewPage(context, _p);
          },
          child: Container(
            width: 150,
            height: 390,
            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        // image: DecorationImage(
                        //   image: NetworkImage(_p.getImages[0]),
                        //   fit: BoxFit.contain,
                        // ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: _p.getImages[0],
                        progressIndicatorBuilder: (
                          context,
                          url,
                          downloadProgress,
                        ) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    // _p.name.length > 20 ? _p.name.substring(0, 20) :
                    _p.getName,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: _p.getDiscount == 0.0
                      ? Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "${_p.getDisplayRetailPrice}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                _buildRatingBar(context, _p.getRating),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "${_p.getDisplayDiscountedRetailPrice}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "${_p.getDisplayRetailPrice}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  // "${_product.currancy} ${_product.retailPrice}",
                                  "-${_p.getDiscount} %",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.deepOrange),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                _buildRatingBar(context, _p.getRating),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildRatingBar(BuildContext context, double rating) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }
}
