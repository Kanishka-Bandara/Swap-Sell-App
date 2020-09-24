import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/app_navigator.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/model/user/address.dart';
import 'package:swap_sell/model/user/contact_metadata.dart';
import 'package:swap_sell/ui/component/app_bar.dart';
import 'package:swap_sell/ui/pages/settings/address_crud.dart';

class AddressesView extends StatefulWidget {
  @override
  _AddressesViewState createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createNormalAppBar(
        context,
        "Addresses",
        false,
        false,
        null,
        null,
      ),
      body: ScopedModel(
        model: AppInit.currentApp,
        child: ScopedModelDescendant<AppInit>(
          builder: (BuildContext context, Widget widget, AppInit model) {
            return Column(
              children: <Widget>[
                model.getCurrentUser.getDefaultAddress(AddressType.DELIVERY) ==
                        null
                    ? Container()
                    : _buildDefaultAddressRow(
                        context,
                        model.getCurrentUser
                            .getDefaultAddress(AddressType.DELIVERY),
                        AddressType.DELIVERY,
                      ),
                model.getCurrentUser.getDefaultAddress(AddressType.BILLING) ==
                        null
                    ? Container()
                    : _buildDefaultAddressRow(
                        context,
                        model.getCurrentUser
                            .getDefaultAddress(AddressType.BILLING),
                        AddressType.BILLING,
                      ),
                _buildAddressRowHeader("Other Addresses"),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.getCurrentUser.getAddresses.length,
                    itemBuilder: (BuildContext context, int index) {
                      Address a = model.getCurrentUser.getAddresses[index];
                      return a.isDefaultAddress == 1
                          ? Column()
                          : _buildAddressRow(
                              context,
                              a,
                            );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNavigator.navigateToAddressCrudView(
            context,
            AddressCrudType.CREATE,
            Address(
              id: null,
              userId: AppInit.currentApp.getCurrentUser.getId,
              typeId: null,
              type: null,
              name: null,
              poCode: null,
              poArea: null,
              street: null,
              city: null,
              district: null,
              province: null,
              country: null,
              isDefaultAddress: null,
              state: null,
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget _buildAddressRow(BuildContext context, Address address) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateToAddressCrudView(
          context,
          AddressCrudType.VIEW,
          address,
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 0,
          right: 10,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            _buildAddressTextRow(context, address.getName),
            _buildAddressTextRow(context, address.getCity),
            _buildAddressTextRow(context, address.getDistrict),
            _buildAddressTextRow(context, address.getProvince),
            _buildAddressTextRow(
                context, address.getPostalArea + " , " + address.getPostalCode),
            _buildAddressTextRow(context, address.getCountry),
          ],
        ),
      ),
    );
  }

  _buildAddressTextRow(BuildContext context, String name) {
    return name == null
        ? Container()
        : Row(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          );
  }

  _buildDefaultAddressRow(
      BuildContext context, Address defaultAddress, AddressType type) {
    return Column(
      children: <Widget>[
        _buildAddressRowHeader(
            "Primary ${AddressTypeController.defaultController.getNameByIndex(type)} Address"),
        _buildAddressRow(
          context,
          defaultAddress,
        ),
      ],
    );
  }

  _buildAddressRowHeader(String s) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 0,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          Text(
            s,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
