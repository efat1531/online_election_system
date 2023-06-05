import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constants.dart';

class ShowDialougeNidVarification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Varification Failed',
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.red,
        ),
      ),
      content: RichText(
        text: TextSpan(
          text: 'Please make sure to input valid ',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: 'Nid Number',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent[400],
              ),
            ),
            TextSpan(
              text: ', ',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: 'Nid Pin Number',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent[400],
              ),
            ),
            TextSpan(
              text: ' and ',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: 'Date of Birth',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent[400],
              ),
            ),
            TextSpan(
              text: '.',
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
              color: k3B3B3B,
            ),
          ),
        )
      ],
    );
  }
}
