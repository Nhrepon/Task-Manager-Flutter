

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Blood());
}

class Blood extends StatelessWidget {
  Blood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Need Blood",
      home: Home();

    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Need Blood"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: [
          Icon(Icons.add)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/blood.svg')
          ],
        ),
      ),
    );
  }
}




// Write flutter code for this UI with “AppBar, IconButton, CircleAvatar, Text, Icon” widgets