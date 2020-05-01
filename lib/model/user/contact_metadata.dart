import 'package:swap_sell/kpackage/metadata_controller.dart';

enum AddressType {
  BILLING,
  DELIVERY,
}

class AddressTypeController extends MetaDataController<AddressType> {
  static AddressTypeController defaultController = AddressTypeController();
  static Map<AddressType, String> _indexMap = {
    AddressType.BILLING: "Billing",
    AddressType.DELIVERY: "Delivery",
  };
  AddressTypeController() : super(_indexMap);
}
