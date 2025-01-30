import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/reset_password_screen.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/utility/colors.dart';
import 'package:task_manager/ui/widgets/background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});
  static const String name = 'forget-password/verify-otp';

  @override
  State<VerifyOtp> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<VerifyOtp> {
  final TextEditingController _otpTEController = TextEditingController();
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
                Text("PIN Verification", style: textTheme.titleLarge,),
                const SizedBox(height: 8,),
                Text("A 6 digit otp has been sent to your email address.", style: textTheme.titleSmall,),
                const SizedBox(height: 20,),
                _buildPinCodeTextField(),

                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){Navigator.pushNamed(context, ResetPasswordScreen.name);},
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

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedColor: appColors.themeColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,

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
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (value)=>false);
              }
          ),
        ]),);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _otpTEController.dispose();
    super.dispose();
  }
}
