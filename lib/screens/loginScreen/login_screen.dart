import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.12,
            //left: MediaQuery.of(context).size.width * 0.25,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome!',
                style: TextStyle(
                  color: k3B3B3B,
                  fontFamily: 'Mont',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.20,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                //color: Colors.red,
                width: MediaQuery.of(context).size.width - 100,
                height: 80,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: const Text(
                  'To continue using this app,  please sign in first.',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: k3B3B3B,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
