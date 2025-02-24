import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/profile_update_screen.dart';

import '../controller/auth_controller.dart';
import '../utility/colors.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigationBar({
    super.key, this.updateProfile = false,
  });

  final bool updateProfile;


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: appColors.themeColor,
      title: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(width: 16,),
          Expanded(
            child: GestureDetector(
              onTap: (){
                if(!updateProfile){
                  Navigator.pushNamed(context, ProfileUpdateScreen.name);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fullName ?? "",
                    style: textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    AuthController.userModel?.email ?? "",
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          IconButton(onPressed: ()async{
            await AuthController.clearData();
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (predict)=>false);},
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}