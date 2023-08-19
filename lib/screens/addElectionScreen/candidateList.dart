import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/candidateModel.dart';

import '../../constants/color_constants.dart';

// ignore: must_be_immutable
class CandidateListView extends StatefulWidget {
  Candidate candidate;
  // ignore: use_key_in_widget_constructors
  CandidateListView(
    this.candidate,
  );

  @override
  State<CandidateListView> createState() => _CandidateListViewState();
}

class _CandidateListViewState extends State<CandidateListView> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: k2CB3CC,
            ),
            padding: const EdgeInsets.only(
              right: 20,
            ),
            height: 50,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/images/Blank_Square.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.candidate.party,
                    style: GoogleFonts.openSansCondensed(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: kEFEFEF,
                      letterSpacing: 1.25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
