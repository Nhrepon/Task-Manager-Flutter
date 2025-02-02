import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse{
  bool isSuccess;
  final String message;
  final Map<String, dynamic>? responseData;

NetworkResponse({required this.isSuccess ,required this.message, this.responseData});
}


class ApiCaller{
static Future<NetworkResponse> getRequest({required String url, Map<String, dynamic>? params})async{
  try{
    Response response = await get(Uri.parse(url));
    debugPrint("Response data: ${response.body}");
    if(response.statusCode == 200){
      final decodeData = jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: true,
          message: "User registration success!",
          responseData: decodeData
      );
    }else{
      return NetworkResponse(
        isSuccess: false,
          message: "User registration failed!"
      );
    }
  }catch(e){
    return NetworkResponse(isSuccess:false, message: e.toString());
  }
}



static Future<NetworkResponse> postRequest({required String url, Map<String, dynamic>? body})async{
  try{
    Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'content-type':'application/json'},
    );
    debugPrint("Response data: ${response.body}");
    if(response.statusCode == 200){
      final decodeData = jsonDecode(response.body);
      return NetworkResponse(
          isSuccess: true,
          message: response.body.toString(),
          responseData: decodeData
      );
    } else if(response.statusCode == 401){
      return NetworkResponse(
          isSuccess: false,
          message: "Email or Password didn't match."
      );
    }else{
      return NetworkResponse(
          isSuccess: false,
          message: response.body.toString()
      );
    }
  }catch(e){
    return NetworkResponse(isSuccess:false, message: e.toString());
  }
}


}