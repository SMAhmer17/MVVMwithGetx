
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  Map<String , Map<String , String>> get keys =>{
     'en_US' : {
      'Internet_Exception' : 'We are unable to show result.\n Please check your internet Connection.',
      'General_exception' : 'We are unable to process your request.\nPlease try Again',
      'Welcome_Back' : 'Welcome Back',
      'Login' : 'Login',
      'Email_hint': 'Email',
      'Password_hint' : 'Password',
      'Home Screen': 'Home Screen'
    },



     'ur_PK' : {
      'email_hint' : 'ای میل درج کریں'
    },
  };
}