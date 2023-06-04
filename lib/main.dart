import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './dummy_screen.dart';
import './screens/loginScreen/login_screen.dart';
import './providers/auth_provider.dart';
import './screens/registrationScreen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Dummy(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}
