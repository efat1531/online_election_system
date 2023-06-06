import 'package:flutter/material.dart';
import './screens/loginScreen/login_screen.dart';
import './screens/nidAddScreen/nidaddScreen.dart';

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
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NidAddScreen.routeName);
              },
              child: Text('Nid Registration')),
          Text('This is dummy Screen'),
        ],
      )),
    );
  }
}
