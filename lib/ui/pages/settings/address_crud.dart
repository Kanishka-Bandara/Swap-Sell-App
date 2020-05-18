import 'package:flutter/material.dart';
import 'package:swap_sell/model/user/address.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/user_component.dart';
import 'package:swap_sell/ui/widgets/kdrop_down_button.dart';
import 'package:swap_sell/ui/widgets/ktext_form_field.dart';

class AddressCRUDVIEW extends StatefulWidget {
  static AddressCrudType currentType;
  static Address address;
  @override
  _AddressCRUDVIEWState createState() =>
      _AddressCRUDVIEWState(currentType, address);
}

class _AddressCRUDVIEWState extends State<AddressCRUDVIEW> {
  AddressCrudType _currentType;
  Address _address;
  _AddressCRUDVIEWState(this._currentType, this._address);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Address",
        false,
        false,
        null,
        _currentType != AddressCrudType.VIEW
            ? null
            : <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _currentType = AddressCrudType.UPDATE;
                    });
                  },
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: 10,
          ),
          child: Column(
            children: <Widget>[
              KTextFormField(
                enabled: _currentType != AddressCrudType.VIEW,
                name: "Name",
                initialValue: _address.getName,
                onChanged: (value) {
                  setState(() {
                    _address.setName = value;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _address.setName = value;
                  });
                },
              ),
              KTextFormField(
                enabled: _currentType != AddressCrudType.VIEW,
                name: "Street",
                initialValue: _address.getStreet,
                onChanged: (value) {
                  setState(() {
                    _address.setStreet = value;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _address.setStreet = value;
                  });
                },
              ),
              UserComponent.buildCountryDropDown(
                context,
                (value) {
                  setState(() {
                    _address.setCountry = value;
                  });
                },
                _address.getCountry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum AddressCrudType {
  CREATE,
  UPDATE,
  VIEW,
}
