import 'package:flutter/material.dart';
import './dummy_screen.dart';
import './screens/loginScreen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo', 
      home: Dummy(),
      routes: {
        LoginScreen.routeName:(context) => LoginScreen(),
      },
    );
  }
}

