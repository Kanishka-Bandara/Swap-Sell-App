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

enum ContactNumberType {
  OFFICIAL,
  PRIVATE,
}

class ContactNumberTypeController
    extends MetaDataController<ContactNumberType> {
  static ContactNumberTypeController defaultController =
      ContactNumberTypeController();
  static Map<ContactNumberType, String> _indexMap = {
    ContactNumberType.OFFICIAL: "Official",
    ContactNumberType.PRIVATE: "Private",
  };
  ContactNumberTypeController() : super(_indexMap);
}

enum EmailType {
  BILLING,
  OFFICIAL,
  BUSINESS,
}

class EmailTypeController extends MetaDataController<EmailType> {
  static EmailTypeController defaultController = EmailTypeController();
  static Map<EmailType, String> _indexMap = {
    EmailType.BILLING: "Billing",
    EmailType.OFFICIAL: "Official",
    EmailType.BUSINESS: "Business",
  };
  EmailTypeController() : super(_indexMap);
}
