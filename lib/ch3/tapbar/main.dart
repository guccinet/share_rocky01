import 'package:flutter/material.dart';
//import 'ch2/WalletScreen.dart';
// import 'package:flutter_application_1/ch3/PopupMenuApp.dart';
import  'package:hello_app/ch3/tapbar/MyTabBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyTabBar(),
    );
    
  }
}//class
