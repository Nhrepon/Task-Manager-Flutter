import 'dart:convert';

import 'package:task_manager/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  static String? accessToken;
  static UserModel? userModel;

  static Future<void> saveUserData(String accessToken, UserModel userModel)async{
    SharedPreferences sharedPreferances = await SharedPreferences.getInstance();
    await sharedPreferances.setString('token', accessToken);
    await sharedPreferances.setString('user-data', jsonEncode(userModel.toJson()));
  }



  static Future<bool> isLogin()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    if(token != null){
      getUserData();
      return true;
    }else{
      return false;
    }
  }



  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    String? data = sharedPreferences.getString("user-data");
    accessToken = token;
    userModel = UserModel.fromJson(jsonDecode(data!));
  }





}