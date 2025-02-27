import 'package:get/get.dart';
import 'package:task_manager/data/services/apiCaller.dart';
import 'package:task_manager/data/services/apiList.dart';

class TaskController extends GetxController{
    //String? get message => _message;
    RxBool _isSuccess = false.obs;
    bool get isSuccess => _isSuccess.value;

    Future<bool> createNewTask(String title, String description)async{
    Map<String, dynamic> reqBody = {
      "title":title,
      "description":description,
      "status": "New"
    };
    final NetworkResponse response = await ApiCaller.postRequest(url: ApiList.createTask, body: reqBody);
    if(response.isSuccess){
        _isSuccess.value = response.isSuccess;
        return true;
    }else{
        return false;
    }
  }
}