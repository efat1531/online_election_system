import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

class ShowDialougeDuplicateNid extends StatelessWidget {
  const ShowDialougeDuplicateNid({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'This NID already Registered',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.red[700],
        ),
      ),
      content: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: 'You are already ',
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: 'Registered ',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red[400],
              ),
            ),
            TextSpan(
              text: '! Did you forget your ',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: 'Password',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red[400],
              ),
            ),
            TextSpan(
              text:
                  '? Please contact administrator office to reset your password.',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Okey',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kMainColor,
            ),
          ),
        )
      ],
    );
  }
}
