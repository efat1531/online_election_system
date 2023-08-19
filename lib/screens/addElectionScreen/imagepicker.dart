import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/constants/color_constants.dart';

class CandidateIconImage extends StatefulWidget {
  const CandidateIconImage({super.key});

  @override
  State<CandidateIconImage> createState() => _CandidateIconImageState();
}

class _CandidateIconImageState extends State<CandidateIconImage> {
  void _takeCandidateSymbol() {}
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: (deviceSize.width - 100) * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: k1D4860,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: _takeCandidateSymbol,
        icon: const Icon(
          Icons.image_outlined,
          color: kMainColor,
        ),
        label: Text(
          'Select Party Symbol',
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: k3B3B3B,
          ),
        ),
      ),
    );
  }
}
