import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/appconfig/camera_controller.dart';
import 'package:swap_sell/controller/product/owner_product_list_controller.dart';
import 'package:swap_sell/controller/product/product_controller.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/model/product/product_matadata.dart';
import 'package:swap_sell/ui/component/default_components.dart';
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
    specifications: Map(),
  );
  List<File> _imgFiles = [];
  String _specsKey;
  String _specsValue;
  Map<String, String> _sp = {};

  //Start :: Create Instance Variables
  TextEditingController textProductName =
      TextEditingController(text: _newProduct.getName);
  TextEditingController textModel =
      TextEditingController(text: _newProduct.getModel);
  TextEditingController textBrand =
      TextEditingController(text: _newProduct.getBrand);
  TextEditingController textRetailPrice =
      TextEditingController(text: _newProduct.getRetailPrice.toString());
  TextEditingController textBarterPrice =
      TextEditingController(text: _newProduct.getBarterPrice.toString());
  TextEditingController textDiscountPrice =
      TextEditingController(text: _newProduct.getDiscountPrice.toString());
  TextEditingController textSpecsKey = TextEditingController();
  TextEditingController textSpecsValue = TextEditingController();
  TextEditingController textDescription =
      TextEditingController(text: _newProduct.getDescription);
  TextEditingController textBarcode =
      TextEditingController(text: _newProduct.getBarcode);
  TextEditingController textDelivery =
      TextEditingController(text: _newProduct.getWhatIsInTheBox);
  TextEditingController textQTY =
      TextEditingController(text: _newProduct.getQty.toString());
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
                            _saveProduct();
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
                context,
                _newProduct,
                _imgFiles,
              );
            },
            child: Icon(Icons.visibility),
          ),
        ),
      ],
    );
  }

  List<Step> _buildProductCreateSteps(BuildContext context) {
    // _newProduct.setSpecifications = <String, String>{};
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
                KDropDownButton<ProductCondition>(
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
                KDropDownButton<ProductDealingType>(
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
                KTextFormField(
                  required: true,
                  name: "Product Name",
                  emptyRequiredMessage: null,
                  textController: textProductName,
                  onChanged: (value) {
                    product.setName = value;
                  },
                  onSaved: (value) {
                    product.setName = value;
                  },
                ),
                KTextFormField(
                  required: true,
                  name: "Model",
                  emptyRequiredMessage: null,
                  textController: textModel,
                  onChanged: (value) {
                    product.setModel = value;
                  },
                  onSaved: (value) {
                    product.setModel = value;
                  },
                ),
                KTextFormField(
                  required: true,
                  name: "Brand",
                  emptyRequiredMessage: null,
                  textController: textBrand,
                  onChanged: (value) {
                    product.setBrand = value;
                  },
                  onSaved: (value) {
                    product.setBrand = value;
                  },
                ),
                KTextFormField(
                  required: true,
                  name: "Retail Price",
                  emptyRequiredMessage: null,
                  textController: textRetailPrice,
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
                KTextFormField(
                  required: true,
                  name: "Exchange Price",
                  emptyRequiredMessage: null,
                  textController: textBarterPrice,
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
                KTextFormField(
                  required: true,
                  name: "Discount Price",
                  emptyRequiredMessage: null,
                  textController: textDiscountPrice,
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
                KTextFormField(
                  required: true,
                  name: "Barcode",
                  emptyRequiredMessage: null,
                  textController: textBarcode,
                  onChanged: (value) {
                    product.setBarcode = value;
                  },
                  onSaved: (value) {
                    product.setBarcode = value;
                  },
                ),
                KTextFormField(
                  required: true,
                  name: "QTY",
                  emptyRequiredMessage: null,
                  textController: textQTY,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.qty = int.parse(value.toString());
                  },
                  onSaved: (value) {
                    if (value.isEmpty) {
                      value = "0";
                    }
                    product.qty = int.parse(value.toString());
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
                KDropDownButton<String>(
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
                KDropDownButton<String>(
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
                KDropDownButton<String>(
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
                KTextFormField(
                  name: "Key",
                  emptyRequiredMessage: null,
                  textController: textSpecsKey,
                  onChanged: (value) {
                    _specsKey = value;
                  },
                  onSaved: (value) {
                    _specsKey = value;
                  },
                ),
                KTextFormField(
                  name: "Value",
                  emptyRequiredMessage: null,
                  textController: textSpecsValue,
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
                        // _sp[_specsKey] = _specsValue;
                        product.specifications = _sp;
                        product.addSpecification(_specsKey, _specsValue);
                        textSpecsKey.clear();
                        textSpecsValue.clear();
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
                KTextFormField(
                  required: true,
                  name: "Description",
                  emptyRequiredMessage: null,
                  isMultiLine: true,
                  maxLines: null,
                  textController: textDescription,
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
                KTextFormField(
                  required: true,
                  name: "What is in the box",
                  emptyRequiredMessage: null,
                  textController: textDelivery,
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
    textProductName.clear();
    textModel.clear();
    textBrand.clear();
    textRetailPrice.clear();
    textBarterPrice.clear();
    textDiscountPrice.clear();
    textSpecsKey.clear();
    textSpecsValue.clear();
    textDescription.clear();
    textDelivery.clear();
  }

  void _saveProduct() async {
    _formKey.currentState.save();
    _newProduct.setSpecifications = _sp;
    _newProduct.shop = AppInit.currentApp.getCurrentShop;
    print(_newProduct.shop.getShopName);
    bool status = await OwnerProductsController.defaultController
        .addToOwnerProductsList(_newProduct, _imgFiles);
    if (status) {
      _clearAll();
      setState(() {
        _imgFiles = [];
      });
      DefaultComponents.showMessage(
        context,
        "Saved successfully..!",
        Icons.save,
        2,
      );
    } else {
      DefaultComponents.showMessage(
        context,
        "Didn't Saved..!",
        Icons.error_outline,
        1,
      );
    }
  }
}
