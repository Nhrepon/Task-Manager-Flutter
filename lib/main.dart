

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
      home: Home()

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
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Image.asset('images/blood.png'),
              radius: 100,

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Donate Blood", style: TextStyle(fontSize: 16),),
            ),
          ],
        ),

      ),
    );
  }
}




// Write flutter code for this UI with “AppBar, IconButton, CircleAvatar, Text, Icon” widgets