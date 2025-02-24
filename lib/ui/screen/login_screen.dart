import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/user_model.dart';
import 'package:task_manager/data/services/apiList.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screen/forget_password_screen.dart';
import 'package:task_manager/ui/screen/home_screen.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/ProgressInButton.dart';
import 'package:task_manager/ui/widgets/background.dart';

import '../../data/services/apiCaller.dart';
import '../widgets/SnackBarMessage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _progress = true;


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: background(child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Get Started With", style: textTheme.titleLarge,),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Valid Email required!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration:  const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Password required!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  Visibility(
                    visible: _progress,
                    replacement: const ProgressInButton(),
                    child: ElevatedButton(
                      onPressed: _loginBtnOnTap,
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(height: 48,),

                  Center(
                    child: Column(
                      children: [
                        TextButton(onPressed: (){Navigator.pushNamed(context, ForgetPassword.name);},
                            child: const Text("Forget password?"),
                        ),
                        _buildSignupSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  void _loginBtnOnTap(){
    if(_formKey.currentState!.validate()){
      _login();
    }
  }

  Future<void> _login() async{
    _progress = false;
    setState(() {});

    Map<String, dynamic> reqBody = {
      'email': _emailTEController.text.trim(),
      'password': _passwordTEController.text,
    };

    final NetworkResponse response = await ApiCaller.postRequest(url: ApiList.login, body: reqBody);

    _progress = true;
    setState(() {});

    if(response.isSuccess){
      String token = response.responseData!["token"];
      UserModel userModel = UserModel.fromJson(response.responseData!["data"]);
      await AuthController.saveUserData(token, userModel);
      _emailTEController.clear();
      _passwordTEController.clear();
      ShowSnackBarMessage(context, response.responseData!["status"]);
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, HomeScreen.name);
      setState(() {});
    }else{
      ShowSnackBarMessage(context, response.message);
    }

  }

  Widget _buildSignupSection() {
    return RichText(text: TextSpan(text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: "Sing up", style: const TextStyle(color: appColors.themeColor),
                            recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushNamed(context, SignupScreen.name);
                            }
                        ),
                      ]),);
  }
@override
  void dispose() {
    // TODO: implement dispose
  _emailTEController.dispose();
  _passwordTEController.dispose();
    super.dispose();
  }
}