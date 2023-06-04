import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../constants/color_constants.dart';
import '../loginScreen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  DateTime _selectedDate = DateTime.parse('0000-00-00');
  void _showDateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1965),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * This contains the device height and width available.
     */
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        /**
         * This container responsible for background color.
         */
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          color: kF5F5F5,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          /**
           * This column is responsible for every element in page
           */
          child: Column(
            children: [
              /**
               * This stack used to view the star image on top of the letter
               */
              Stack(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.13,
                    width: deviceSize.width,
                  ),
                  Positioned(
                    right: deviceSize.width * 0.06,
                    top: deviceSize.height * 0.03,
                    child: SvgPicture.asset(
                      'assets/svg/login_screen_top_svg.svg',
                      height: deviceSize.height * 0.15,
                      width: deviceSize.height * 0.14,
                    ),
                  ),
                ],
              ),
              /**
               * Sign Up Text in top
               */
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                width: deviceSize.width - 80,
                alignment: Alignment.topCenter,
                //color: Colors.red,
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: k3B3B3B,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /**
               * This container resposible for create form
               */
              Container(
                width: deviceSize.width - 60,
                child: Form(
                  /**
                   * This column hold the form elements with button
                   */
                  child: Column(
                    children: [
                      /**
                       * First Input First Name and Last Name
                       */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /**
                           * This container is for Input First Name
                           */
                          Container(
                            height: deviceSize.height * 0.07,
                            width: (deviceSize.width - 60) * 0.48,
                            decoration: BoxDecoration(
                              color: kFFFFFF,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
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
                                hintText: 'Frist Name',
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                              keyboardType: TextInputType.name,
                              enableSuggestions: false,
                              autocorrect: false,
                            ),
                          ),
                          /**
                           * This container is responsible for input last name
                           */
                          Container(
                            height: deviceSize.height * 0.07,
                            width: (deviceSize.width - 60) * 0.43,
                            decoration: BoxDecoration(
                              color: kFFFFFF,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
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
                                hintText: 'Last Name',
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                              keyboardType: TextInputType.name,
                              enableSuggestions: false,
                              autocorrect: false,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This container is for taking NID as Input
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
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
                            hintText: 'NID Number',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This container is for taking phone number input
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
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
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This container is responsible for taking email input
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
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
                            hintText: 'Email',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This container is responsible for Password
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
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
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          obscureText: true,
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This container is responsible for Retype password
                       */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
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
                            hintText: 'Retype Password',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This row is for taking NID pin and pick up Birth Date
                       */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /**
                           * This container is for nid pin
                           */
                          Container(
                            height: deviceSize.height * 0.07,
                            width: (deviceSize.width - 60) * 0.49,
                            decoration: BoxDecoration(
                              color: kFFFFFF,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
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
                                hintText: 'NID Pin',
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                            ),
                          ),
                          /**
                           * This container is for Date of Birth
                           */
                          Stack(
                            children: [
                              Container(
                                height: deviceSize.height * 0.07,
                                width: (deviceSize.width - 60) * 0.49,
                                decoration: BoxDecoration(
                                  color: kFFFFFF,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  bottom: 15,
                                  left: 15,
                                ),
                                child: Text(
                                  //'12 Dec 2023',
                                  _selectedDate == DateTime.parse('0000-00-00')
                                      ? 'Date of Birth'
                                      : DateFormat('MMM d, yyyy')
                                          .format(_selectedDate),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: k3B3B3B,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 3,
                                child: IconButton(
                                  onPressed: () {
                                    _showDateTimePicker();
                                    print('Boss');
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                       * This is Submit Button for login Screen
                       */
                      GestureDetector(
                        onTap: () {
                          print(deviceSize.height);
                          print(deviceSize.width);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width - 60,
                          height: deviceSize.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kMainColor,
                          ),
                          child: Text(
                            'Create An Account',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: kFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: deviceSize.width - 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: GoogleFonts.montserrat(
                        color: k3B3B3B,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        'Sign In',
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
