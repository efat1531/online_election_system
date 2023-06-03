import 'package:flutter/material.dart';
import './screens/loginScreen/login_screen.dart';

class Dummy extends StatelessWidget {
  static String routeName = '/dummy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
              child: Text('Login')),
          Text('This is dummy Screen'),
        ],
      )),
    );
  }
}
