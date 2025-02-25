import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/add_new_task_screen.dart';
import 'package:task_manager/ui/screen/forget_password_screen.dart';
import 'package:task_manager/ui/screen/home_screen.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/profile_update_screen.dart';
import 'package:task_manager/ui/screen/reset_password_screen.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/screen/splash_screen.dart';
import 'package:task_manager/ui/screen/verify_otp_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorSchemeSeed: appColors.themeColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: appColors.themeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              fixedSize: Size.fromWidth(double.maxFinite),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                  fontSize: 16
              )
          ),
        ),

      ),
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }else if(settings.name == LoginScreen.name){
          widget = const LoginScreen();
        }else if(settings.name == SignupScreen.name){
          widget = const SignupScreen();
        }else if(settings.name == ForgetPassword.name){
          widget = const ForgetPassword();
        }else if(settings.name == VerifyOtp.name){
          widget = const VerifyOtp();
        }else if(settings.name == ResetPasswordScreen.name){
          widget = const ResetPasswordScreen();
        }else if(settings.name == HomeScreen.name){
          widget = const HomeScreen();
        }else if(settings.name == AddNewTaskScreen.name){
          widget = const AddNewTaskScreen();
        }else if(settings.name == ProfileUpdateScreen.name){
          widget = const ProfileUpdateScreen();
        }
        return MaterialPageRoute(builder: (_)=>widget);
      },
    );
  }
}
