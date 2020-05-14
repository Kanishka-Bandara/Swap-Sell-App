import 'package:swap_sell/kpackage/metadata_controller.dart';

enum AddressType {
  ignore,
  BILLING,
  DELIVERY,
}

class AddressTypeController extends MetaDataController<AddressType> {
  static AddressTypeController defaultController = AddressTypeController();
  static Map<AddressType, String> _indexMap = {
    AddressType.ignore:"ignore",
    AddressType.BILLING: "Billing",
    AddressType.DELIVERY: "Delivery",
  };
  AddressTypeController() : super(_indexMap);
}

enum ContactNumberType {
  ignore,
  OFFICIAL,
  PRIVATE,
}

class ContactNumberTypeController
    extends MetaDataController<ContactNumberType> {
  static ContactNumberTypeController defaultController =
      ContactNumberTypeController();
  static Map<ContactNumberType, String> _indexMap = {
    ContactNumberType.ignore:"ignore",
    ContactNumberType.OFFICIAL: "Official",
    ContactNumberType.PRIVATE: "Personal",
  };
  ContactNumberTypeController() : super(_indexMap);
}

enum EmailType {
  ignore,
  AUTHENTICATION,
  BILLING,
  NOTIFICATION,
  MESSAGES,
}

class EmailTypeController extends MetaDataController<EmailType> {
  static EmailTypeController defaultController = EmailTypeController();
  static Map<EmailType, String> _indexMap = {
    EmailType.ignore:"ignore",
    EmailType.AUTHENTICATION: "Authentication",
    EmailType.BILLING: "Billing",
    EmailType.NOTIFICATION: "Notification",
    EmailType.MESSAGES: "Messages",
  };
  EmailTypeController() : super(_indexMap);
}
