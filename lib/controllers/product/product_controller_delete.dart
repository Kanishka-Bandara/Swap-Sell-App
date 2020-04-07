import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:csv/csv.dart';
import 'dart:convert';

import 'package:swap_sell/model/shop/shop.dart';

class ProductControllerDelete {
  static List<List<dynamic>> data = [];
  static List<Product> mainList = [];
  static List<Product> _searchResults = [];
  static List<Product> _reasentSearchedList = [];

  static Future<List<Product>> get resentSearchedProductList async {
    if (mainList.length == 0) {
      loadMainProductList();
    }
    _reasentSearchedList = new List(10);
    for (var i = 0; i < 10; i++) {
      _reasentSearchedList[i] = mainList[i];
    }
    print("Getting resent serached list");
    return _reasentSearchedList;
  }

  static Future<List<Product>> getSearchedProductList(String query) async {
    if (mainList.length == 0) {
      loadMainProductList();
    }
    print("Gettting searched product list");
    print("query = $query");
    _searchResults = (query == "")
        ? resentSearchedProductList
        : mainList.where((p) => p.getname.contains(query)).toList();
    print("done");
    return _searchResults;
  }

  static loadAsset() async {
    print("Starting to read");
    final mydata = await rootBundle.loadString("assets/product_samples.csv");
    print("Data Loaded");
    List<List<dynamic>> csv = CsvToListConverter().convert(mydata);
    data = csv;
  }

  static get loadMainProductList {
    if (data.length == 0) {
      ProductControllerDelete.loadAsset();
    }
    print("Loading Values to the main list");
    int pCount = data.length;
    String a = "";
    pCount = 50;
    List<Product> list = new List(pCount);
    for (var i = 1; i < pCount; i++) {
      int _id = i;
      String _uniqueID = data[i][0].toString();
      String _name = data[i][3].toString();
      double _retailPrice = data[i][6] == "" ? 1000.00 : data[i][6].toDouble();
      double _delivaryPrice = 150.00;
      double _discount = data[i][6] == "" ? 0.00 : data[i][7].toDouble();
      List<String> _images;
      List<String> _imagesString;
      String _description = data[i][10].toString().replaceAll("~", ",");
      double _rating = data[i][11].toDouble();
      int _qty = new Random().nextInt(1000);
      Map<String, String> _specifications = Map();
      Map<String, String> _specificationsString = Map();
      int _saleCount = new Random().nextInt(500);
      int _returnCount = new Random().nextInt(5);
      String _headCategory;
      String _mainCategory;
      String _subCategory;
      String _condition = i % 10 == 0 ? "Brand New" : "Used";
      String _brand = data[i][13] == ""
          ? _name.split(" ")[0]
          : data[i][13].toString().substring(0, 1).toUpperCase() +
              data[i][13]
                  .toString()
                  .substring(1, data[i][13].toString().length)
                  .toLowerCase();
      String _model = "MDL$i";
      Shop _shop = Shop.exampleShop;
      bool _isFavorite = i % 20 == 0 ? true : false;
      String _currancy = "Rs";

//Start :: Set values to specs
      if (data[i][14] == "") {
      } else {
        String a = data[i][14].toString();
        a = a.replaceAll("]}", "");
        a = a.replaceAll('{"product_specification"=>[', "");
        List<String> sp = a.split("}~");
        List<Map<String, dynamic>> sm = new List(sp.length);
        for (var i = 0; i < sp.length; i++) {
          sp[i] = sp[i].replaceAll("{", "");
          sp[i] = sp[i].replaceAll("=>", " : ");
          sp[i] = "{" + sp[i] + "}";
          sp[i] = sp[i].replaceAll("~", " , ");
          sp[i] = sp[i].replaceAll("}}", " }");
          sm[i] = json.decode(sp[i].toString());
        }
        sm.forEach((key) {
          if (key.containsKey("key")) {
            if (key.containsKey("value")) {
              _specifications[key["key"]] = key["value"].toString();
              _specificationsString['\"' + key["key"] + '\"'] =
                  '\"' + key["value"].toString() + '\"';
            }
          }
        });
      }
// End :: Set values to specs

//Start :: Set Values to image
      String b = data[i][8].toString();
      b.replaceAll('"', "");
      List<String> im = b.split("~").toList();
      _images = List(im.length);
      _imagesString = List(im.length);
      for (var i = 0; i < im.length; i++) {
        String key = im[i];
        key = key.replaceAll("[", "");
        key = key.replaceAll("]", "");
        key = key.replaceAll('"', "");
        key = key.trim();
        _images[i] = key;
        _imagesString[i] = "\"" + key + "\"";
      }
//End :: Set Values to image

//Start :: Set Values to Categories
      List<String> cat = data[i][4].toString().split("~");
      if (cat.length > 0) {
        // _headCategory = cat[0].length>20?cat[0].substring(0,20):cat[0];
        _headCategory = cat[0].trim();
      } else {
        _headCategory = "Head Cat";
      }
      if (cat.length > 1) {
        // _mainCategory = cat[1].length>20?cat[1].substring(0,20):cat[1];
        _mainCategory = cat[1].trim();
      } else {
        _mainCategory = "Main Cat";
      }
      if (cat.length > 2) {
        // _subCategory = cat[2].length>20?cat[2].substring(0,20):cat[2];
        _subCategory = cat[2].trim();
      } else {
        _subCategory = "Sub Cat";
      }
// End :: Set values to Categories
      i--;
      list[i] = Product(
        id: _id,
        uniqueID: _uniqueID,
        name: _name,
        retailPrice: _retailPrice,
        delivaryPrice: _delivaryPrice,
        discountPrice: _discount,
        images: _images,
        description: _description,
        rating: _rating,
        qty: _qty,
        specifications: _specifications,
        saleCount: _saleCount,
        returnCount: _returnCount,
        headCategory: _headCategory,
        mainCategory: _mainCategory,
        subCategory: _subCategory,
        condition: _condition,
        model: _model,
        brand: _brand,
        shop: _shop,
        isFavorite: _isFavorite,
        currancy: _currancy,
      );
      list[i].setid = _id;
      list[i].setuniqueID = _uniqueID;
      list[i].setname = _name;
      list[i].setretailPrice = _retailPrice;
      list[i].setdelivaryPrice = _delivaryPrice;
      list[i].setdiscountedRetailPrice = _discount;
      list[i].setimages = _images;
      list[i].setdescription = _description;
      list[i].setrating = _rating;
      list[i].setspecifications = _specifications;
      list[i].setsaleCount = _saleCount;
      list[i].setreturnCount = _returnCount;
      list[i].setheadCategory = _headCategory;
      list[i].setmainCategory = _mainCategory;
      list[i].setsubCategory = _subCategory;
      list[i].setcondition = _condition;
      list[i].setmodel = _model;
      list[i].setbrand = _brand;
      list[i].setshop = _shop;
      list[i].setisFavorite = _isFavorite;
      list[i].setcurrancy = _currancy;
      // print("${list[i].name} added");

      a += " mainList[$i] = Product(" +
          " id: ${list[i].id}," +
          "uniqueID: \"${list[i].getuniqueID}\"," +
          " name: \"${list[i].getname}\"," +
          " retailPrice: ${list[i].getretailPrice}," +
          " delivaryPrice: ${list[i].getdelivaryPrice}," +
          " discountPrice: ${list[i].getdiscount}," +
          " images: $_imagesString," +
          "description: \"${list[i].getdescription}\"," +
          " rating: ${list[i].getrating}," +
          "  qty: ${list[i].getqty}," +
          " specifications: $_specificationsString," +
          " saleCount: ${list[i].getsaleCount}," +
          " returnCount: ${list[i].getreturnCount}," +
          " headCategory: \"${list[i].getheadCategory}\"," +
          " mainCategory: \"${list[i].getmainCategory}\"," +
          " subCategory: \"${list[i].getsubCategory}\"," +
          "condition: \"${list[i].getcondition}\"," +
          " model: \"${list[i].getmodel}\"," +
          " brand: \"${list[i].getbrand}\"," +
          " shop: Shop.exampleShop," +
          " isFavorite: ${list[i].getisFavorite}," +
          "currancy: \"${list[i].getcurrancy}\"," +
          "); \n";
      i++;
    }
    // print(list);
    print("Done\n\n");
    // for (var i = 0; i < list.length; i++) {
    // }
    a = a.replaceAll("I/flutter (10500):  ", "");
    printWrapped(a);
    // Clipboard.setData(new ClipboardData(text: a));
    // var file = new File("assets/product.txt").writeAsString(a);
  }

  static void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
