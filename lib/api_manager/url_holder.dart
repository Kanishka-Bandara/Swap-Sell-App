class URLHolder {
  // BEGIN::MAIN URL
  static const String MAIN_URL = "http://10.0.2.2:8080";
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
  // END::Location URL
  // BEGIN::USER URL
  static const String _USER_PACKAGE = MAIN_URL + "/user";
  static const String _TITLE_PACKAGE = _USER_PACKAGE + "/title";
  static const String ALL_USER_TITLES_LIST_URL = _TITLE_PACKAGE + "/getAll";
  static const String USER_CREATE_URL = _USER_PACKAGE + "/create";
  static const String USER_UPDATE_PROFILE_PICTURE_URL =
      _USER_PACKAGE + "/updateProfilePicture";
  // END::USER URL
  // BEGIN::GENDER URL
  static const String _GENDER_PACKAGE = MAIN_URL + "/gender";
  static const String ALL_GENDER_LIST_URL = _GENDER_PACKAGE + "/getAll";
  // END::GENDER URL
}
