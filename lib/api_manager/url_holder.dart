class URLHolder{
   static const String MAIN_URL = "http://10.0.2.2:8080/"; 
   static const String _AUTH_PACKAGE = MAIN_URL+"/auth";
   static const String _SIGNUP_PACKAGE = _AUTH_PACKAGE+"/signUp";
   static const String SIGNUP_URL = _SIGNUP_PACKAGE; 
   static const String USERNAME_ALREADY_EXISTS_URL = SIGNUP_URL+"/userNameAlreadyExist"; 
   static const String EMAIL_ALREADY_EXISTS_URL = SIGNUP_URL+"/userEmailAlreadyExist"; 

   
}