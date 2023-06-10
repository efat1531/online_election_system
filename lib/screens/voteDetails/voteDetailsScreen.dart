import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/candidateModel.dart';
import 'package:oes/screens/voteDetails/candidateList.dart';
import '../../constants/color_constants.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../models/election_model.dart';

class VoteDetailsScreen extends StatefulWidget {
  static String routeName = '/homescreen/ElectionViewByID';

  @override
  State<VoteDetailsScreen> createState() => _VoteDetailsScreenState();
}

class _VoteDetailsScreenState extends State<VoteDetailsScreen> {
  late Candidate _selectedCandidate;
  DateTime _currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final election = ModalRoute.of(context)?.settings.arguments as Election;
    int totalVotets =
        Provider.of<UserProvider>(context).voterCount(election.validFor);
    Future<void> _onRefreshFunction() async {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      setState(() {
        _currentTime = DateTime.now();
        //print(((election.endTime.compareTo(_currentTime)) >= 0));
      });
    }

    double percentageCalculator(int casted) {
      return ((casted.toDouble() * 100.00) / (totalVotets.toDouble()));
    }

    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kF5F5F5,
      bottomNavigationBar:
          ((election.startTime.compareTo(_currentTime)) <= 0) &&
                  ((election.endTime.compareTo(_currentTime)) >= 0)
              ? Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 15,
                    right: 15,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: k1A2D3A,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Cast Your Vote',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kCDCDCD,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
      body: RefreshIndicator(
        onRefresh: _onRefreshFunction,
        child: Column(
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
                        'Total Voters : $totalVotets',
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
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCandidate = election.candidateList[index];
                      });
                    },
                    child: CandidateList(
                        election.candidateList[index], totalVotets)),
                itemCount: election.candidateList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
