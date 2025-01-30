import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/verify_otp_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/background.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static const String name = 'forget-password';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailTEController = TextEditingController();
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
                Text("Enter your email address", style: textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text("A 6 digit otp will be sent to your email address.", style: textTheme.titleSmall,),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){Navigator.pushNamed(context, VerifyOtp.name);},
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
    _emailTEController.dispose();
    super.dispose();
  }
}
