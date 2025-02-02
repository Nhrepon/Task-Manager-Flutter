import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/services/apiCaller.dart';
import 'package:task_manager/data/services/apiList.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/ProgressInButton.dart';
import 'package:task_manager/ui/widgets/SnackBarMessage.dart';
import 'package:task_manager/ui/widgets/background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String name = 'signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _progress = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: background(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Text("Join With Us", style: textTheme.titleLarge,),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _firstNameTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "First name",),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "First name required!";
                    }
                    return null;
                  },
                ),const SizedBox(height: 20,),
                TextFormField(
                  controller: _lastNameTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Last name",),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Last name required!";
                    }
                    return null;
                  },
                ),const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Email",),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Please, Enter your valid email address!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Mobile",),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Valid mobile number required!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration:  const InputDecoration(hintText: "Password",),
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
                    onPressed: _onTapSignUpButton,
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
                const SizedBox(height: 48,),

                Center(
                  child: Column(
                    children: [
                      _buildLoginSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){
      _userRegistration();
    }
  }

  Future<void> _userRegistration()async{
    _progress = false;
    setState(() {});
    Map<String, dynamic> reqBody = {
      'firstName': _firstNameTEController.text.trim(),
      'lastName': _lastNameTEController.text.trim(),
      'email': _emailTEController.text.trim(),
      'mobile': _mobileTEController.text.trim(),
      'password': _passwordTEController.text,
      'photo': "https://avatars.githubusercontent.com/u/54746335?s=400&u=ff3fab88ecfe57f74216b035ad540bc5b7a36cd9&v=4",
    };
    final NetworkResponse response = await ApiCaller.postRequest(url: ApiList.registration, body: reqBody);
    _progress = true;
    setState(() {});
    if(response.isSuccess){
      _clearField();
      ShowSnackBarMessage(context, response.message);
    }else{
      ShowSnackBarMessage(context, response.message);
    }
  }
  void _clearField(){
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _emailTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }


  Widget _buildLoginSection() {
    return RichText(text: TextSpan(text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: "Login", style: const TextStyle(color: appColors.themeColor),
                            recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushReplacementNamed(context, LoginScreen.name);
                            }
                        ),
                      ]),);
  }
@override
  void dispose() {
    // TODO: implement dispose
  _firstNameTEController.dispose();
  _lastNameTEController.dispose();
  _emailTEController.dispose();
  _mobileTEController.dispose();
  _passwordTEController.dispose();
    super.dispose();
  }
}