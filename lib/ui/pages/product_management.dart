import 'package:flutter/material.dart';
import 'package:swap_sell/model/product/product.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/widgets/ktext_field.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class ProductManagement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagementState();
  }
}

class _ProductManagementState extends State<ProductManagement> {
  final GlobalKey<FormState> _formKeyCreate = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyEdit = GlobalKey<FormState>();
  int _currentStepCreate = 0;
  Product _newProduct = Product();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ApplicationBar.createNormalAppBar(
          context,
          "Product Management",
          false,
          true,
          TabBar(
            tabs: <Widget>[
              Tab(
                text: "Create",
              ),
              Tab(
                text: "Edit",
              ),
              Tab(
                text: "Delete",
              ),
              Tab(
                text: "View",
              ),
            ],
          ),
        ),
        drawer: MyMenu.getMyMenu(context),
        body: TabBarView(
          children: <Widget>[
            _buildProductCreateSection(context),
            _buildProductEditSection(context),
            _buildProductDeleteSection(context),
            _buildProductListViewSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCreateSection(BuildContext context) {
    //TODO:Finish _buildProductCreateSection
    return SingleChildScrollView(
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
                setState(() {
                  this._currentStepCreate = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (this._currentStepCreate <
                      this._buildProductCreateSteps().length - 1) {
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
              steps: _buildProductCreateSteps(),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> _buildProductCreateSteps() {
    List<Step> _steps = <Step>[
      Step(
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
            KTextFormField(
              name: "Condition",
              emptyRequiredMessage: null,
              onSaved: (value) {
                _newProduct.condition = value;
              },
            ),
            KTextFormField(
              name: "Can Barter",
              emptyRequiredMessage: null,
              onSaved: (value) {
                _newProduct.canBarter = value as bool;
              },
            ),
          ],
        ),
      ),
      Step(
        title: Text("Category"),
        isActive: _currentStepCreate >= 1,
        content: Column(children: <Widget>[
          
        ],),
      ),
      Step(
        title: Text("Media"),
        isActive: _currentStepCreate >= 2,
        content: Column(),
      ),
      Step(
        title: Text("Specifications"),
        isActive: _currentStepCreate >= 3,
        content: Column(),
      ),
      Step(
        title: Text("Description"),
        isActive: _currentStepCreate >= 4,
        content: Column(),
      ),
    ];
    return _steps;
  }

  Widget _buildProductEditSection(BuildContext context) {
    //TODO:Finish _buildProductEditSection
    return Center(
      child: Text("Product Edit"),
    );
  }

  Widget _buildProductDeleteSection(BuildContext context) {
    //TODO:Finish _buildProductDeleteSection
    return Center(
      child: Text("Product Delete"),
    );
  }

  Widget _buildProductListViewSection(BuildContext context) {
    //TODO:Finish _buildProductListViewSection
    return Center(
      child: Text("Product List"),
    );
  }
}
