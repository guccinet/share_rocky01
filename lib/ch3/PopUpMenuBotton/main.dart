import 'package:flutter/material.dart';
import 'package:hello_app/ch3/PopUpMenuBotton/MyPopupMenuButtonEx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wallet App'),
          actions: const [
            MyPopupMenuButtonEx(), // display iconmenu
          ],
        ),

        body: const Center(child: Text('home')),
      ),
    );
  }
}
