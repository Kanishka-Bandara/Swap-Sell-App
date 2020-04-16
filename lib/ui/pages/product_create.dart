import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/appconfig/camera_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/widgets/kdrop_down_button.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class ProductCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _currentStepCreate = 0;
  Product _newProduct = Product();
  List<File> _imgFiles = [];
  String _specsKey;
  String _specsValue;

  //Start :: Create Instance Variables
  KTextFormField _text_ProductName;
  KTextFormField _text_Model;
  KTextFormField _text_Brand;
  KTextFormField _text_RetailPrice;
  KTextFormField _text_DiscountPrice;
  KDropDownButton _dropDown_SelectCondition;
  KDropDownButton _dropDown_CanBarter;
  KDropDownButton _dropDown_CatedoryHead;
  KDropDownButton _dropDown_CatedoryMain;
  KDropDownButton _dropDown_CatedorySub;
  KTextFormField _text_SpecsKey;
  KTextFormField _text_SpecsValue;
  KTextFormField _text_Description;
  //End :: Create Instance Variables

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stepper(
                      // type: StepperType.horizontal,
                      currentStep: _currentStepCreate,
                      onStepTapped: (step) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          this._currentStepCreate = step;
                        });
                      },
                      onStepContinue: () {
                        setState(() {
                          if (this._currentStepCreate <
                              this._buildProductCreateSteps(context).length -
                                  1) {
                            this._currentStepCreate =
                                this._currentStepCreate + 1;
                          } else {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            _clearAll();
                          }
                        });
                      },
                      onStepCancel: () {
                        setState(() {
                          if (this._currentStepCreate > 0) {
                            this._currentStepCreate =
                                this._currentStepCreate - 1;
                          } else {
                            this._currentStepCreate = 0;
                          }
                        });
                      },
                      steps: _buildProductCreateSteps(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width - 70,
          top: MediaQuery.of(context).size.height - 200,
          child: FloatingActionButton(
            onPressed: () {
              AppNavigator.navigateToProductDummyViewPage(
                  context, _newProduct, _imgFiles);
            },
            child: Icon(Icons.visibility),
          ),
        ),
      ],
    );
  }

  List<Step> _buildProductCreateSteps(BuildContext context) {
    _newProduct.setspecifications = {};
    List<Step> _steps = <Step>[
      _buildStepMainDetails(context),
      _buildStepCategory(context),
      _buildStepMedia(context),
      _buildStepSpecifications(context),
      _buildStepDescription(context),
    ];
    return _steps;
  }

  Step _buildStepMainDetails(BuildContext context) {
    return Step(
      title: Text("Main Details"),
      isActive: _currentStepCreate >= 0,
      content: Column(
        children: <Widget>[
          _text_ProductName = KTextFormField(
            required: true,
            name: "Product Name",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              _newProduct.name = value;
            },
          ),
          _text_Model = KTextFormField(
            required: true,
            name: "Model",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              _newProduct.model = value;
            },
          ),
          _text_Brand = KTextFormField(
            required: true,
            name: "Brand",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              _newProduct.brand = value;
            },
          ),
          _text_RetailPrice = KTextFormField(
            required: true,
            name: "Retail Price",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              if (value.isEmpty) {
                value = "0";
              }
              _newProduct.retailPrice = double.parse(value.toString());
            },
          ),
          _text_DiscountPrice = KTextFormField(
            required: true,
            name: "Discount Price",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              if (value.isEmpty) {
                value = "0";
              }
              _newProduct.discountPrice = double.parse(value.toString());
            },
          ),
          SizedBox(
            height: 10,
          ),
          _dropDown_SelectCondition = KDropDownButton<String>(
            value: _newProduct.condition,
            hint: Row(
              children: <Widget>[
                Text("Select Condition"),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("Brand New"),
                  ],
                ),
                value: "1",
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("Used"),
                  ],
                ),
                value: "2",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _newProduct.condition = value;
              });
            },
          ),
          _dropDown_CanBarter = KDropDownButton<String>(
            value: _newProduct.canBarter ? "0" : "1",
            hint: Row(
              children: <Widget>[
                Text("Can Barter"),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("Yes"),
                  ],
                ),
                value: "1",
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("No"),
                  ],
                ),
                value: "0",
              ),
            ],
            onChanged: (value) {
              setState(() {
                if (value.toString() == "1") {
                  _newProduct.canBarter = true;
                } else {
                  _newProduct.canBarter = false;
                }
                // _newProduct.canBarter = value as bool;
              });
            },
          ),
        ],
      ),
    );
  }

  Step _buildStepCategory(BuildContext context) {
    return Step(
      title: Text("Category"),
      isActive: _currentStepCreate >= 1,
      content: Column(
        children: <Widget>[
          _dropDown_CatedoryHead = KDropDownButton<String>(
            value: _newProduct.headCategory,
            hint: Row(
              children: <Widget>[
                Text("Select Head Category"),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("HA"),
                  ],
                ),
                value: "1",
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("HB"),
                  ],
                ),
                value: "2",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _newProduct.headCategory = value;
              });
            },
          ),
          _dropDown_CatedoryMain = KDropDownButton<String>(
            value: _newProduct.mainCategory,
            hint: Row(
              children: <Widget>[
                Text("Select Main Category"),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("MA"),
                  ],
                ),
                value: "1",
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("MB"),
                  ],
                ),
                value: "2",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _newProduct.mainCategory = value;
              });
            },
          ),
          _dropDown_CatedorySub = KDropDownButton<String>(
            value: _newProduct.subCategory,
            hint: Row(
              children: <Widget>[
                Text("Sub Category"),
              ],
            ),
            items: [
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("SA"),
                  ],
                ),
                value: "1",
              ),
              DropdownMenuItem(
                child: Row(
                  children: <Widget>[
                    Text("SB"),
                  ],
                ),
                value: "2",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _newProduct.subCategory = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Step _buildStepMedia(BuildContext context) {
    return Step(
      title: Text("Media"),
      isActive: _currentStepCreate >= 2,
      content: Column(
        children: <Widget>[
          _imgFiles.length > 0
              ? Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _imgFiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              _imgFiles[index],
                            ),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 5,
                          right: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _imgFiles.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Column(
                  children: <Widget>[
                    Text("No images have been selected."),
                  ],
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
                onPressed: () async {
                  File image = await CameraController.defaultController
                      .getImage(context);
                  setState(() {
                    if (image != null) {
                      _imgFiles.add(image);
                      print(image.path);
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Step _buildStepSpecifications(BuildContext context) {
    return Step(
      title: Text("Specifications"),
      isActive: _currentStepCreate >= 3,
      content: Column(
        children: <Widget>[
          _text_SpecsKey = KTextFormField(
            name: "Key",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              setState(() {
                _specsKey = value;
              });
            },
          ),
          _text_SpecsValue = KTextFormField(
            name: "Value",
            emptyRequiredMessage: null,
            textController: TextEditingController(),
            onSaved: (value) {
              setState(() {
                _specsValue = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _newProduct.specifications[_specsKey] = _specsValue;
                  });
                },
                color: Theme.of(context).backgroundColor,
                child: Text(
                  "Add",
                  style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(children: [
            _newProduct.specifications == null ||
                    _newProduct.specifications.length <= 0
                ? Column()
                : Container(
                    // width: 150,
                    height: 30,
                    child: ListView.builder(
                      itemCount: _newProduct.specifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key =
                            _newProduct.specifications.keys.elementAt(index);
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("$key"),
                                Text("${_newProduct.specifications[key]}"),
                              ],
                            ),
                            // ListTile(
                            //   title: Text("$key"),
                            //   subtitle: Text("${_newProduct.specifications[key]}"),
                            // ),
                            Divider(
                              height: 2.0,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ]),
        ],
      ),
    );
  }

  Step _buildStepDescription(BuildContext context) {
    return Step(
      title: Text("Description"),
      isActive: _currentStepCreate >= 4,
      content: Column(
        children: <Widget>[
          _text_Description = KTextFormField(
            required: true,
            name: "Description",
            emptyRequiredMessage: null,
            isMultiLine: true,
            maxLines: null,
            textController: TextEditingController(),
            onSaved: (value) {
              setState(
                () {
                  _newProduct.description = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _clearAll() {
    _text_ProductName.clear();
    _text_Model.clear();
    _text_Brand.clear();
    _text_RetailPrice.clear();
    _text_DiscountPrice.clear();
    _text_SpecsKey.clear();
    _text_SpecsValue.clear();
    _text_Description.clear();
  }
}
