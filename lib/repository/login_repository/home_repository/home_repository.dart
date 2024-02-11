
import 'package:getxmvvm/data/network/network_api_services.dart';
import 'package:getxmvvm/model/home/user_list_model.dart';
import 'package:getxmvvm/model/login/user_model.dart';
import 'package:getxmvvm/resources/app_url/app_url.dart';

class HomeRepository{

  final _apiServices = NetworkApiServices();

  Future<UserListModel> userLIstApi()async{
    dynamic response =await _apiServices.getApi(Appurl.userListApi);
      return UserListModel.fromJson(response);
  }
}