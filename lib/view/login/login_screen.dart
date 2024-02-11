import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getxmvvm/resources/Colors/app_colors.dart';
import 'package:getxmvvm/resources/components/round_button.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_model/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Login'.tr , style: TextStyle(color: AppColor.whiteColor),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [   
            TextFormField(
              controller: loginViewModel.emailController.value,
              focusNode: loginViewModel.emailFocusNode.value,
              validator: (value) {
                if(value!.isEmpty){
                  Utils.toastMessageBottom('Enter Email');
                }
              },
               onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value  ,  loginViewModel.passwordFocusNode.value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                prefix: Padding(
                  padding:  EdgeInsets.symmetric( horizontal : 3),
                  child: Icon(Icons.email),
                ),
                hintText: 'Email_hint'.tr,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03,),
            TextFormField(
              controller: loginViewModel.passwordController.value,
              focusNode: loginViewModel.passwordFocusNode.value,
              validator: (value) {
                if(value!.isEmpty){
                  Utils.toastMessageBottom('Enter Password');
                }
                return null;
              },
              onFieldSubmitted: (value) {
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                   
                  borderRadius: BorderRadius.circular(20)
                ),
                prefix: const Padding(
                  padding:  EdgeInsets.symmetric( horizontal : 3),
                  child: Icon(Icons.lock),
                ),
                hintText: 'Password_hint'.tr,
              ),
            ),
                ],
              ),
            ),

            SizedBox(height: 40,),
           Obx(() =>  RoundButton(
            title: 'Login'.tr, 
            loading: loginViewModel.loading.value,
            onPress: () {
              if(_formKey.currentState!.validate()){
                loginViewModel.loginApi();
              }

            }))
        
          ],
        ),
      ),
    );
  }
}