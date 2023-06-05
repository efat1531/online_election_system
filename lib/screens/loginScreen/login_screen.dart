// ignore_for_file: slash_for_doc_comments, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';
import '../registrationScreen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordFocusNode.dispose();
    super.dispose();
  }

  /**
   * This map holds the data for user login
   */
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      /**
       * This stack is for placing background and widgets in the background
       */
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          color: kF5F5F5,
          child: Column(
            //padding: EdgeInsets.all(0),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.20,
                    width: deviceSize.width,
                  ),
                  Positioned(
                    right: deviceSize.width * 0.06,
                    top: deviceSize.height * 0.05,
                    child: SvgPicture.asset(
                      'assets/svg/login_screen_top_svg.svg',
                      height: deviceSize.height * 0.15,
                      width: deviceSize.height * 0.14,
                    ),
                  ),
                ],
              ),
              /**
               * Welcome text on top
               */
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.montserrat(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: k3B3B3B,
                  ),
                ),
              ),
              /**
               * Continue using this app text after welcome
               */
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  //color: Colors.red,
                  width: deviceSize.width - 100,
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Text(
                    'To continue using this app,  please sign in first.',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: k3B3B3B,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              /**
               * Sizebox for alignment.
               */
              SvgPicture.asset(
                'assets/svg/login_page_middle_svg.svg',
                height: deviceSize.height * 0.29,
                alignment: Alignment.center,
              ),
              /**
               * This the form we are taking input.
               */
              Form(
                key: _formkey,
                child: SizedBox(
                  height: deviceSize.height * 0.25,
                  width: deviceSize.width - 80,
                  //color: Colors.red,
                  /**
                   * Here we are adding the form inputs
                   */
                  child: Column(
                    children: [
                      /**
                       * First input Email
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: k3B3B3B,
                          ),
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              //fontWeight: FontWeight.w400,
                              color: k3B3B3B,
                            ),
                            hintText: 'Email Address',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Insert Email';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _authData['email'] = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: deviceSize.height * 0.07,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        /**
                         * Second Input Password
                         */
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          focusNode: _passwordFocusNode,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: k3B3B3B,
                          ),
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              //fontWeight: FontWeight.w400,
                              color: k3B3B3B,
                            ),
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Insert Password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          textInputAction: TextInputAction.done,
                          onSaved: (newValue) {
                            _authData['password'] = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This is Submit Button for login Screen
                       */
                      GestureDetector(
                        onTap: () {
                          final _isValid = _formkey.currentState!.validate();
                          if (!_isValid) return;
                          _formkey.currentState?.save();
                          print(_authData);
                          print(deviceSize.height);
                          print(deviceSize.width);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width - 80,
                          height: deviceSize.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kMainColor,
                          ),
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /**
              * This hold Text and a Text Button. If user doesn't have an account he can easily make one by tapping text button
              */
              Container(
                width: deviceSize.width - 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have any account?',
                      style: GoogleFonts.montserrat(
                        color: k3B3B3B,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegistrationScreen.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          color: k3B3B3B,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
