

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxmvvm/data/response/status.dart';
import 'package:getxmvvm/resources/Colors/app_colors.dart';
import 'package:getxmvvm/resources/components/general_exceptions.dart';
import 'package:getxmvvm/resources/components/internet_exception_widgets.dart';
import 'package:getxmvvm/resources/routes/routes_names.dart';
import 'package:getxmvvm/view_model/controller/home_VM/home_Controller.dart';
import '../../../view_model/controller/user_preferences/user_preference_VM.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeController = Get.put(HomeController());
   UserPreferences userPreferences = UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.SecondaryColorButton,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreferences.removeUser().then((value){
              Get.toNamed(RouteName.LoginScreen);
            });
          }, icon: Icon(Icons.logout))
        ],
        centerTitle:  true,
        title: Text('Home Screen'.tr),
      ),
      body: Obx(() {
       switch(homeController.RxRequestStatus.value){
        case Status.LOADING:
        return Center(child: CircularProgressIndicator());

        case Status.ERROR:
        if(homeController.error.value == 'No Internet'){
        return InternetExceptionWidget(onPress: (){
          homeController.refreshApi();
        }); }
        else{
          return GeneralExceptionWidget(onPress: (){
            homeController.refreshApi();
          },);
        }
        case Status.COMPLETED:
        return ListView.builder(
          itemCount: homeController.userList.value.data!.length,
          itemBuilder: (context , index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString() ),),
              title: Text(homeController.userList.value.data![index].firstName.toString()),
              subtitle: Text(homeController.userList.value.data![index].email.toString()),
            ),
          );
        });
        

       }  
      
        return SizedBox();
      }),
    );
  }
}