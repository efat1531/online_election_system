import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

class ErrorDialouge extends StatelessWidget {
  final String errorMessage;
  ErrorDialouge(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'An Error Occurred!',
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.red[400],
        ),
      ),
      content: Text(
        errorMessage,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Okay',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kMainColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
