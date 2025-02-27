import 'package:flutter/material.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screen/home_screen.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widgets/background.dart';
import '../widgets/appLogo.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name  = '/';
  @override
  State<SplashScreen> createState()=> _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 1));
    bool isLogin = await AuthController.isLogin();
    if(isLogin){
      Get.offAllNamed(HomeScreen.name);
    }else{
      Get.offAllNamed(LoginScreen.name);
    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: background(
        child: Center(
          child: AppLogo(),
        ),
      ),
    );
  }

}

