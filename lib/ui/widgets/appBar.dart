import 'package:flutter/material.dart';

import '../utility/colors.dart';

class app_bar extends StatelessWidget implements PreferredSizeWidget {
  app_bar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: appColors.themeColor,
      title: Row(
        children: [
          CircleAvatar(),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nur Hossain",
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  "nurhossainrepon7248@gmail.com",
                  style: textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}