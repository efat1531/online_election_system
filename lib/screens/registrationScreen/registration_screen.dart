// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    /**
     * This contains the device height and width available.
     */
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
            width: deviceSize.width-80,
            alignment: Alignment.topCenter,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
