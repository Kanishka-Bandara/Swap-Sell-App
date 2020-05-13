import 'package:swap_sell/kpackage/metadata_controller.dart';

enum UserType {
  ignore,
  SELLER,
  BUYER,
  SELLER_AND_BUYER,
}

class UserTypeController extends MetaDataController<UserType> {
  static UserTypeController defaultController = UserTypeController();
  static Map<UserType, String> _indexMap = {
    UserType.ignore:"ignore",
    UserType.SELLER: "Seller",
    UserType.BUYER: "Seller_And_Buyer",
    UserType.SELLER_AND_BUYER: "Delivery",
  };
  UserTypeController() : super(_indexMap);
}