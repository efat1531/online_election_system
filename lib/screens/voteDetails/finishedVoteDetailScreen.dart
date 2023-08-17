import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/candidateModel.dart';
import 'package:oes/providers/auth_provider.dart';
import 'package:oes/screens/voteDetails/FinishedELectionCandidateList.dart';
import '../../constants/color_constants.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../models/election_model.dart';
import '../../constants/constants.dart';

class FinishedVoteDetailsScreen extends StatelessWidget {
  static String routeName = '/homescreen/FinishedElectionViewByID';

  FinishedVoteDetailsScreen({super.key});
  int totalVoters = 0;

  @override
  Widget build(BuildContext context) {
    final election = ModalRoute.of(context)?.settings.arguments as Election;

    String userID = Provider.of<AuthProvider>(context, listen: false).userId;

    void totalVotersCount() {
      election.validFor.forEach((element) {
        totalVoters += Provider.of<UserProvider>(context, listen: false)
            .voterCount(element);
      });
    }

    double percentageCalculator(int casted) {
      totalVotersCount();
      return ((casted.toDouble() * 100.00) / (totalVoters.toDouble()));
    }

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kF5F5F5,
      body: Column(
        children: [
          Container(
            color: kMainColor,
            height: deviceSize.height * 0.36,
            width: deviceSize.width,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.keyboard_double_arrow_left_rounded,
                      size: 25,
                      color: kF8F8EE,
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 50,
                  child: Text(
                    'Election Details',
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kF8F8EE,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: Container(
                    //color: Colors.red,
                    height: 100,
                    width: deviceSize.width,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 5,
                      left: 20,
                      right: 20,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        election.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: kF8F8EE,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  child: Container(
                    //color: Colors.red,
                    height: 40,
                    width: deviceSize.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      'Total Voters : $totalVoters',
                      style: GoogleFonts.openSansCondensed(
                        color: kF8F8EE,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    //color: Colors.red,
                    height: 40,
                    width: deviceSize.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vote Cast : ${election.voterUserId.length}',
                          style: GoogleFonts.openSansCondensed(
                            color: kF8F8EE,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cast Percentage : ${percentageCalculator(election.voterUserId.length)}%',
                          style: GoogleFonts.openSansCondensed(
                            color: kF8F8EE,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                List<Candidate> _newList = election.candidateList
                    .where(
                      (element) => element.area == voteArea[index],
                    )
                    .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 8,
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        voteArea[index],
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) =>
                          CandidateList(_newList[index], totalVoters),
                      itemCount: _newList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      //physics: const AlwaysScrollableScrollPhysics(),
                    )
                  ],
                );
              },
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: voteArea.length,
            ),
          ),
        ],
      ),
    );
  }
}
