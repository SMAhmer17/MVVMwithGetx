
import 'package:get/get.dart';
import 'package:getxmvvm/data/response/status.dart';
import 'package:getxmvvm/model/home/user_list_model.dart';
import 'package:getxmvvm/model/login/user_model.dart';
import 'package:getxmvvm/repository/login_repository/home_repository/home_repository.dart';

class HomeController extends GetxController{


  final _api = HomeRepository();
  
  final RxRequestStatus = Status.LOADING.obs;

  final userList = UserListModel().obs;

  // For error handeling

  RxString error = ''.obs;


  void setRxRequestStatus(Status _value){
      RxRequestStatus.value = _value;
  }

  void setUserList(UserListModel _value){
      userList.value = _value;
  }

   void setError(String _value){
      error.value = _value;
  }

  void userListApi(){
    // setRxRequestStatus(Status.LOADING);

      _api.userLIstApi().then((value){

        setRxRequestStatus(Status.COMPLETED);

        setUserList(value);

      }).onError((error, stackTrace){
        setError(error.toString());
          setRxRequestStatus(Status.ERROR);
      });
  }

  
  void refreshApi(){
    setRxRequestStatus(Status.LOADING);

      _api.userLIstApi().then((value){

        setRxRequestStatus(Status.COMPLETED);

        setUserList(value);

      }).onError((error, stackTrace){
        setError(error.toString());
          setRxRequestStatus(Status.ERROR);
      });
  }


}