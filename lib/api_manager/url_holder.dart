class URLHolder {
  // BEGIN::MAIN URL
  // static const String MAIN_URL = "http://10.0.2.2:8080";
  static const String MAIN_URL = "http://192.168.8.101:8080";
  // END::MAIN URL
  // BEGIN::AUTH URL
  static const String _AUTH_PACKAGE = MAIN_URL + "/auth";
  static const String _SIGNUP_PACKAGE = _AUTH_PACKAGE + "/signUp";
  static const String _SIGNIN_PACKAGE = _AUTH_PACKAGE + "/signIn";
  static const String SIGNUP_URL = _SIGNUP_PACKAGE;
  static const String SIGNIN_FB_URL = _SIGNIN_PACKAGE + "/fb";
  static const String SIGNIN_G_URL = _SIGNIN_PACKAGE + "/google";
  static const String SIGNIN_NORMAL_URL = _SIGNIN_PACKAGE + "/normal";
  static const String USERNAME_ALREADY_EXISTS_URL =
      SIGNUP_URL + "/userNameAlreadyExist";
  static const String EMAIL_ALREADY_EXISTS_URL =
      SIGNUP_URL + "/userEmailAlreadyExist";
  // END::AUTH URL
  // BEGIN::Location URL
  static const String _LOCATION_PACKAGE = MAIN_URL + "/location";
  static const String ALL_COUNTRY_LIST_URL =
      _LOCATION_PACKAGE + "/getAllCountries";
  static const String ALL_PROVINCE_LIST_BY_COUNTRY_URL =
      _LOCATION_PACKAGE + "/getAllProvincesByCountry";
  static const String ALL_DISTRICT_LIST_BY_PROVINCE_URL =
      _LOCATION_PACKAGE + "/getAllDistrictsByProvince";
  static const String ALL_POSTAL_CODE_LIST_BY_DISTRICT_URL =
      _LOCATION_PACKAGE + "/getAllPostalCodesByDistrict";
  // END::Location URL
  // BEGIN::USER URL
  static const String _USER_PACKAGE = MAIN_URL + "/user";
  static const String _TITLE_PACKAGE = _USER_PACKAGE + "/title";
  static const String ALL_USER_TITLES_LIST_URL = _TITLE_PACKAGE + "/getAll";
  static const String USER_CREATE_URL = _USER_PACKAGE + "/create";
  static const String USER_EDIT_URL = _USER_PACKAGE + "/edit";
  static const String USER_GET_URL = _USER_PACKAGE + "/get";
  static const String USER_UPDATE_PROFILE_PICTURE_URL =
      _USER_PACKAGE + "/updateProfilePicture";
  // END::USER URL
  // BEGIN::SHOP URL
  static const String _SHOP_PACKAGE = MAIN_URL + "/shop";
  static const String SHOP_CREATE_URL = _SHOP_PACKAGE + "/create";
  static const String SHOP_EDIT_URL = _SHOP_PACKAGE + "/edit";
  static const String SHOP_GET_BY_ID_URL = _SHOP_PACKAGE + "/getById";
  static const String SHOP_GET_BY_USER_ID_URL = _SHOP_PACKAGE + "/getByUserId";
  // END::SHOP URL
  // BEGIN::GENDER URL
  static const String _GENDER_PACKAGE = MAIN_URL + "/gender";
  static const String ALL_GENDER_LIST_URL = _GENDER_PACKAGE + "/getAll";
  // END::GENDER URL

  // BEGIN::NOTIFICATION URL
  // TODO::
  static const String _NOTIFICATION_PACKAGE = MAIN_URL + "/notification";
  static const String ALL_NOTIFICATION_LIST_URL =
      _NOTIFICATION_PACKAGE + "/getAll";
  static const String SET_NOTIFICATION_AS_READ_URL =
      _NOTIFICATION_PACKAGE + "/setAsRead";
  static const String SET_NOTIFICATION_AS_READ_BULK_URL =
      _NOTIFICATION_PACKAGE + "/setAsReadBulk";
  static const String DELETE_NOTIFICATION_URL =
      _NOTIFICATION_PACKAGE + "/delete";
  // END::NOTIFICATION URL
  // BEGIN::MESSAGE URL
  static const String _MESSAGE_PACKAGE = MAIN_URL + "/message";
  static const String SEND_MESSAGE_URL = _MESSAGE_PACKAGE + "/send";
  static const String SET_MESSAGES_AS_READ_URL =
      _MESSAGE_PACKAGE + "/setMessagesAsRead";
  static const String GET_MESSAGE_LIST_URL = _MESSAGE_PACKAGE + "/getAll";
  static const String DELETE_MESSAGE_URL = _MESSAGE_PACKAGE + "/delete";
  // static const String GET_ARCHIVED_MESSAGES_LIST_URL = _MESSAGE_PACKAGE + "/getAllArchived";
  // static const String ARCHIVE_MESSAGE_URL = _MESSAGE_PACKAGE + "/doArchive";
  // END::MESSAGE URL
  // BEGIN::PRODUCT URL
  static const String _PRODUCT_PACKAGE = MAIN_URL + "/product";
  static const String CREATE_PRODUCT_URL = _PRODUCT_PACKAGE + "/create";
  // END::PRODUCT URL
}
