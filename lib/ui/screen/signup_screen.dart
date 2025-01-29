import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
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
                ),const SizedBox(height: 20,),
                TextFormField(
                  controller: _lastNameTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Last name",),
                ),const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Email",),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(hintText: "Mobile",),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration:  const InputDecoration(hintText: "Password",),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){},
                  child: const Icon(Icons.arrow_circle_right_outlined),
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


  Widget _buildLoginSection() {
    return RichText(text: TextSpan(text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: "Login", style: const TextStyle(color: appColors.themeColor),
                            recognizer: TapGestureRecognizer()..onTap=(){
                          Navigator.pushNamed(context, LoginScreen.name);
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