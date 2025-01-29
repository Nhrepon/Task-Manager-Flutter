import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/background.dart';

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
                const SizedBox(height: 120,),
                Text("Get Started With", style: textTheme.titleLarge,),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration:  const InputDecoration(
                    hintText: "Password",
                  ),
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
                      TextButton(onPressed: (){}, child: const Text("Forget password?")),
                      _buildSignupSection(),
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


  Widget _buildSignupSection() {
    return RichText(text: TextSpan(text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: "Sing up", style: TextStyle(color: appColors.themeColor),
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