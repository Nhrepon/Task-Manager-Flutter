

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Blood())
}

class Blood extends StatelessWidget {
  Blood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Need Blood",
      home: AppBar(
        title: "Need Blood",
        centerTitle: true,
        actions: [
          Icon(Icons.add)
        ],
      ),
    )
  }
}
