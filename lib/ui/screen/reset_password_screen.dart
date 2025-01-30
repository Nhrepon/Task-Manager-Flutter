import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/home_screen.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/verify_otp_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const String name = 'forget-password/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
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
                Text("Reset password", style: textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text("Enter a 6 character password", style: textTheme.titleSmall,),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _newPasswordTEController,
                  obscureText: true,
                  decoration:  const InputDecoration(
                    hintText: "New Password",
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _confirmPasswordTEController,
                  obscureText: true,
                  decoration:  const InputDecoration(
                    hintText: "Confirm New Password",
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){Navigator.pushReplacementNamed(context, HomeScreen.name);},
                  child: const Text("Confirm"),
                ),

              ],
            ),
          ),
        ),
      )),
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
