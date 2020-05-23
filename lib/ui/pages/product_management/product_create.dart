import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/controllers/appconfig/camera_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/components/default_components.dart';
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
  static Product _newProduct = Product(
      id: 0,
      uniqueID: "",
      name: "",
      description: "",
      specifications: <String, String>{"a": "a", "b": "b"});
  List<File> _imgFiles = [];
  String _specsKey;
  String _specsValue;
  Map<String, String> _sp = {};

  //Start :: Create Instance Variables
  KTextFormField _text_ProductName;
  KTextFormField _text_Model;
  KTextFormField _text_Brand;
  KTextFormField _text_RetailPrice;
  KTextFormField _text_BarterPrice;
  KTextFormField _text_DiscountPrice;
  KDropDownButton _dropDown_SelectCondition;
  KDropDownButton _dropDown_dealingType;
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
                            // _clearAll();
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
              print("specs = ${_newProduct.getSpecifications}");
              AppNavigator.navigateToProductDummyViewPage(
                context,
                _newProduct,
                _imgFiles,
                _sp,
              );
            },
            child: Icon(Icons.visibility),
          ),
        ),
      ],
    );
  }

  List<Step> _buildProductCreateSteps(BuildContext context) {
    _newProduct.setSpecifications = {};
    List<Step> _steps = <Step>[
      _buildStepMainDetails(context),
      _buildStepCategory(context),
      _buildStepMedia(context),
      _buildStepSpecifications(context),
      _buildStepDescription(context),
      _buildStepDelivery(context),
    ];
    return _steps;
  }

  Step _buildStepMainDetails(BuildContext context) {
    return Step(
      title: Text("Main Details"),
      isActive: _currentStepCreate >= 0,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
              children: <Widget>[
                _dropDown_SelectCondition = KDropDownButton<ProductCondition>(
                  value: product.getCondition,
                  hint: Row(
                    children: <Widget>[
                      Text("Select Condition"),
                    ],
                  ),
                  items: ProductConditionController.defaultController
                      .getNamesAsListForDropDown(),
                  onChanged: (value) {
                    setState(() {
                      product.setCondition = value;
                    });
                  },
                ),
                _dropDown_dealingType = KDropDownButton<ProductDealingType>(
                  value: product.getDealingType,
                  hint: Row(
                    children: <Widget>[
                      Text("Dealing Type"),
                    ],
                  ),
                  items: ProductDealingTypeController.defaultController
                      .getNamesAsListForDropDown(),
                  onChanged: (value) {
                    setState(() {
                      product.setDealingType = value;
                    });
                  },
                ),
                _text_ProductName = KTextFormField(
                  required: true,
                  name: "Product Name",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(text: product.getName),
                  onChanged: (value) {
                    product.setName = value;
                  },
                  onSaved: (value) {
                    product.setName = value;
                  },
                ),
                _text_Model = KTextFormField(
                  required: true,
                  name: "Model",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(text: product.getModel),
                  onChanged: (value) {
                    product.setModel = value;
                  },
                  onSaved: (value) {
                    product.setModel = value;
                  },
                ),
                _text_Brand = KTextFormField(
                  required: true,
                  name: "Brand",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(text: product.getBrand),
                  onChanged: (value) {
                    product.setBrand = value;
                  },
                  onSaved: (value) {
                    product.setBrand = value;
                  },
                ),
                _text_RetailPrice = KTextFormField(
                  required: true,
                  name: "Retail Price",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(
                      text: product.getRetailPrice.toString()),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.setRetailPrice = double.parse(value.toString());
                  },
                  onSaved: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.setRetailPrice = double.parse(value.toString());
                  },
                ),
                _text_BarterPrice = KTextFormField(
                  required: true,
                  name: "Exchange Price",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(
                      text: product.getBarterPrice.toString()),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.setBarterPrice = double.parse(value.toString());
                  },
                  onSaved: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.setBarterPrice = double.parse(value.toString());
                  },
                ),
                _text_DiscountPrice = KTextFormField(
                  required: true,
                  name: "Discount Price",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(
                      text: product.discountPrice.toString()),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.discountPrice = double.parse(value.toString());
                  },
                  onSaved: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.discountPrice = double.parse(value.toString());
                  },
                ),
                _text_DiscountPrice = KTextFormField(
                  required: true,
                  name: "Barcode",
                  emptyRequiredMessage: null,
                  textController:
                      TextEditingController(text: product.getBarcode),
                  onChanged: (value) {
                    product.setBarcode = value;
                  },
                  onSaved: (value) {
                    product.setBarcode = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Step _buildStepCategory(BuildContext context) {
    return Step(
      title: Text("Category"),
      isActive: _currentStepCreate >= 1,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
              children: <Widget>[
                _dropDown_CatedoryHead = KDropDownButton<String>(
                  value: product.getHeadCategory,
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
                      product.setHeadCategory = value;
                    });
                  },
                ),
                _dropDown_CatedoryMain = KDropDownButton<String>(
                  value: product.getMainCategory,
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
                      product.setMainCategory = value;
                    });
                  },
                ),
                _dropDown_CatedorySub = KDropDownButton<String>(
                  value: product.getSubCategory,
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
                      product.setSubCategory = value;
                    });
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Step _buildStepMedia(BuildContext context) {
    return Step(
      title: Text("Media"),
      isActive: _currentStepCreate >= 2,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
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
            );
          },
        ),
      ),
    );
  }

  Step _buildStepSpecifications(BuildContext context) {
    return Step(
      title: Text("Specifications"),
      isActive: _currentStepCreate >= 3,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
              children: <Widget>[
                // TextFormField(
                //   decoration: InputDecoration(labelText: "Key",),
                //   validator: (v){
                //     if (v.isEmpty) {
                //       return "This field is required";
                //     }
                //     return null;
                //   },
                //   onChanged: (v){

                //   },
                // ),
                _text_SpecsKey = KTextFormField(
                  name: "Key",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(text: _specsKey),
                  onChanged: (value) {
                    _specsKey = value;
                  },
                  onSaved: (value) {
                    _specsKey = value;
                  },
                ),
                _text_SpecsValue = KTextFormField(
                  name: "Value",
                  emptyRequiredMessage: null,
                  textController: TextEditingController(text: _specsValue),
                  onChanged: (value) {
                    _specsValue = value;
                  },
                  onSaved: (value) {
                    _specsValue = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        if (_specsKey == null || _specsKey.isEmpty) {
                          DefaultComponents.showMessage(
                            context,
                            "Key is empty.Please Fill the key content.",
                            Icons.error,
                            1,
                          );
                          return;
                        }
                        if (_specsValue == null || _specsValue.isEmpty) {
                          DefaultComponents.showMessage(
                            context,
                            "Key is empty.Please Fill the value content.",
                            Icons.error,
                            1,
                          );
                          return;
                        }
                        _sp[_specsKey] = _specsValue;
                        product.specifications = _sp;
                        print(_sp);
                        print(product.specifications);
                        _specsKey = "";
                        _specsValue = "";
                      },
                      color: Theme.of(context).backgroundColor,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    product.specifications == null ||
                            product.specifications.length <= 0
                        ? Column()
                        : Container(
                            // width: 150,
                            height: 30,
                            child: ListView.builder(
                              itemCount: product.specifications.length,
                              itemBuilder: (BuildContext context, int index) {
                                String key = product.specifications.keys
                                    .elementAt(index);
                                return Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("$key"),
                                        Text("${product.specifications[key]}"),
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
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Step _buildStepDescription(BuildContext context) {
    return Step(
      title: Text("Description"),
      isActive: _currentStepCreate >= 4,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
              children: <Widget>[
                _text_Description = KTextFormField(
                  required: true,
                  name: "Description",
                  emptyRequiredMessage: null,
                  isMultiLine: true,
                  maxLines: null,
                  textController:
                      TextEditingController(text: product.description),
                  onChanged: (value) {
                    product.description = value;
                  },
                  onSaved: (value) {
                    product.description = value;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Step _buildStepDelivery(BuildContext context) {
    return Step(
      title: Text("Delivery"),
      isActive: _currentStepCreate >= 4,
      content: ScopedModel(
        model: _newProduct,
        child: ScopedModelDescendant<Product>(
          builder: (BuildContext context, Widget widget, Product product) {
            return Column(
              children: <Widget>[
                _text_Description = KTextFormField(
                  required: true,
                  name: "What is in the box",
                  emptyRequiredMessage: null,
                  textController:
                      TextEditingController(text: product.getWhatIsInTheBox),
                  onChanged: (value) {
                    product.setWhatIsInTheBox = value;
                  },
                  onSaved: (value) {
                    product.setWhatIsInTheBox = value;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _clearAll() {
    _newProduct = Product(id: 0, uniqueID: "", name: "", description: "");
    // _text_ProductName.clear();
    // _text_Model.clear();
    // _text_Brand.clear();
    // _text_RetailPrice.clear();
    // _text_DiscountPrice.clear();
    // _text_SpecsKey.clear();
    // _text_SpecsValue.clear();
    // _text_Description.clear();
  }

}
