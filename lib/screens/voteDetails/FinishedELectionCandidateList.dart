import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/constants/color_constants.dart';
import '../../models/candidateModel.dart';

class CandidateList extends StatelessWidget {
  final Candidate candidate;
  final int totalVoters;
  CandidateList(this.candidate, this.totalVoters);

  double calculateVotePercentage(int vote) {
    return ((vote * 100).toDouble() / totalVoters.toDouble());
  }

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
            decoration: const BoxDecoration(
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
            right: 0,
            child: Container(
              height: 50,
              width: (deviceSize.width - 50) *
                  ((calculateVotePercentage(candidate.voteCount)) / 100.00),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: k163343,
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      color: kF5F5F5,
                    ),
                    child: candidate.symbol != null
                        ? Image.network(
                            candidate.symbol,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/Blank_Square.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    candidate.party,
                    style: GoogleFonts.openSansCondensed(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: kEFEFEF,
                      letterSpacing: 1.25,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${calculateVotePercentage(candidate.voteCount).toStringAsFixed(2)}%',
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
