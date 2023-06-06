import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

class SomethingWentWrongDialouge extends StatelessWidget {
  const SomethingWentWrongDialouge({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Opps!',
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.red[700],
        ),
      ),
      content: RichText(
        text: TextSpan(
          text: 'Something went ',
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
          children: [
            TextSpan(
              text: 'Wrong',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: '. Contact administrator as soon as possible.',
              style: GoogleFonts.montserrat(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            )
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
              color: kMainColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
