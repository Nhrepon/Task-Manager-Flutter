import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/services/apiCaller.dart';
import 'package:task_manager/data/services/apiList.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/ProgressInButton.dart';
import 'package:task_manager/ui/widgets/appNavigationBar.dart';
import 'package:task_manager/ui/widgets/background.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});
  static const String name = 'profile-update';

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool progress = true;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  XFile? pickedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTEController.text = AuthController.userModel?.email ?? '';
    _firstNameTEController.text = AuthController.userModel?.firstName ?? '';
    _lastNameTEController.text = AuthController.userModel?.lastName ?? '';
    _mobileTEController.text = AuthController.userModel?.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppNavigationBar(
        updateProfile: true,
      ),
      body: background(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80,),
                Text("Profile", style: textTheme.titleLarge,),
                const SizedBox(height: 20,),
                _buildImgPicker(),
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
                  enabled: false,
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
                Visibility(
                  visible: progress,
                  replacement: const ProgressInButton(),
                  child: ElevatedButton(
                    onPressed: (){onTapUpdateButton();},
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),

              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildImgPicker() {
    return GestureDetector(
      onTap: imagePicker,
      child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height:56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)
                          )
                        ),
                        alignment: Alignment.center,
                        child: const Text("Photo", style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 12,),
                      Text(pickedImage == null ? "No item selected": pickedImage!.name, maxLines: 1,)
                  ],
                  ),
                ),
    );
  }

  Future<void> imagePicker()async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      pickedImage = image;
      setState(() {});
    }
  }


  void onTapUpdateButton(){
    if(_formKey.currentState!.validate()){
      updateProfile();
    }
  }

  Future<void> updateProfile()async{
    progress = false;
    setState(() {});
    Map<String, dynamic> reqBody = {
      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName":_lastNameTEController.text.trim(),
      "mobile":_mobileTEController.text.trim(),
    };
    if(pickedImage != null){
      List<int> imgBytes = await pickedImage!.readAsBytes();
      reqBody["photo"] =base64Encode(imgBytes);
    }
    if(_passwordTEController.text.isNotEmpty){
      reqBody["password"] = _passwordTEController.text;
    }
    final NetworkResponse response = await ApiCaller.postRequest(url: ApiList.profileUpdate, body: reqBody);

    progress = true;
    setState(() {});
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
