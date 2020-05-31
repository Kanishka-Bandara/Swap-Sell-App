// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  final double _width;
  final double _height;
  double _radius = 0;
  final BuildContext _context;
  static int _offset = 0;
  static int _time = 800;
  ShimmerTile(
    this._width,
    this._height,
    this._context,
  );
  ShimmerTile.withRadius(
    this._width,
    this._height,
    this._context,
    this._radius,
  );
  @override
  Widget build(BuildContext context) {
    context = _context;
    _offset += 5;
    _time = 800 + _offset;
    return Stack(
      children: <Widget>[
        Shimmer.fromColors(
          baseColor: Theme.of(context).backgroundColor,
          // baseColor: Colors.grey,
          highlightColor: Colors.white,
          period: Duration(milliseconds: _time),
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(_radius != null ? _radius : 5),
              color: Theme.of(context).backgroundColor,
            ),
            // color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
