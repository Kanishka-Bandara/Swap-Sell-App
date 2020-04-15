import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _formKeyCreate = GlobalKey<FormState>();
  int _currentStepCreate = 0;
  Product _newProduct = Product();
  String _specsKey;
  String _specsValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
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
                        this._buildProductCreateSteps(context).length - 1) {
                      this._currentStepCreate = this._currentStepCreate + 1;
                    } else {
                      //TODO:Logic to check if everithing is completed.
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this._currentStepCreate > 0) {
                      this._currentStepCreate = this._currentStepCreate - 1;
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
    );
  }

  List<Step> _buildProductCreateSteps(BuildContext context) {
    _newProduct.setspecifications = {"Color :": "Red"};
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
          KTextFormField(
            name: "Product Name",
            emptyRequiredMessage: null,
            onSaved: (value) {
              _newProduct.name = value;
            },
          ),
          KTextFormField(
            name: "Model",
            emptyRequiredMessage: null,
            onSaved: (value) {
              _newProduct.model = value;
            },
          ),
          KTextFormField(
            name: "Brand",
            emptyRequiredMessage: null,
            onSaved: (value) {
              _newProduct.brand = value;
            },
          ),
          KTextFormField(
            name: "Retail Price",
            emptyRequiredMessage: null,
            onSaved: (value) {
              _newProduct.retailPrice = value as double;
            },
          ),
          KTextFormField(
            name: "Discount Price",
            emptyRequiredMessage: null,
            onSaved: (value) {
              _newProduct.discountPrice = value as double;
            },
          ),
          SizedBox(
            height: 10,
          ),
          KDropDownButton<String>(
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
          KDropDownButton<String>(
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
          KDropDownButton<String>(
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
          KDropDownButton<String>(
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
          KDropDownButton<String>(
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
      content: Column(),
    );
  }

  Step _buildStepSpecifications(BuildContext context) {
    return Step(
      title: Text("Specifications"),
      isActive: _currentStepCreate >= 3,
      content: Column(
        children: <Widget>[
          KTextFormField(
            name: "Key",
            emptyRequiredMessage: null,
            onSaved: (value) {
              setState(() {
                _specsKey = value;
              });
            },
          ),
          KTextFormField(
            name: "Value",
            emptyRequiredMessage: null,
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
            Container(
              // width: 150,
              height: 30,
              child: ListView.builder(
                itemCount: _newProduct.specifications.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = _newProduct.specifications.keys.elementAt(index);
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
          KTextFormField(
              name: "Description",
              emptyRequiredMessage: null,
              onSaved: (value) {
                setState(() {
                  _newProduct.description = value;
                });
              })
        ],
      ),
    );
  }

}
