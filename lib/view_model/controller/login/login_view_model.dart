


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/model/login/user_model.dart';
import 'package:getxmvvm/repository/login_repository/login_repository.dart';
import 'package:getxmvvm/resources/routes/routes_names.dart';
import 'package:getxmvvm/utils/utils.dart';
import '../../../../view_model/controller/user_preferences/user_preference_VM.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();
UserPreferences userPreferences = UserPreferences();


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;


  Rx loading = false.obs;


  void loginApi(){

    loading.value = true;

    Map data = {

      'email' : emailController.value.text,
     'password' : passwordController.value.text
    };

    _api.loginApi(data).then((value) {
       loading.value = false;
      Utils.snackBar('Login', 'Login Successful');
      
     UserModel userModel = UserModel(
        token: value['token'],
        isLogin: true,
      );
      // store data in sharedPreference
                      // (UserModel.fromJson(value)
      userPreferences.saveUser(userModel).then((value) {
        Get.toNamed(RouteName.HomeScreen);
      }).onError((error, stackTrace) {
        Utils.toastMessageBottom(error.toString());
      });
    

    })
    .onError((error, stackTrace){
       loading.value = false;
        Utils.snackBar('Error', error.toString());
    });
  }

} 