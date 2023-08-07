import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/election_model.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../providers/auth_provider.dart';
import '../../providers/user_provider.dart';
import './candidateList.dart';

class LiveElectionViewer extends StatefulWidget {
  static String routeName = 'LiveElectionView';
  @override
  State<LiveElectionViewer> createState() => _LiveElectionViewerState();
}

class _LiveElectionViewerState extends State<LiveElectionViewer> {
  @override
  Widget build(BuildContext context) {
    final election = ModalRoute.of(context)?.settings.arguments as Election;
    int totalVotets =
        Provider.of<UserProvider>(context).voterCount(election.validFor);
    final String userID = Provider.of<AuthProvider>(context, listen: false).userId;
    final String userArea = Provider.of<UserProvider>(context, listen: false).userArea(userID);

    double percentageCalculator(int casted) {
      return ((casted.toDouble() * 100.00) / (totalVotets.toDouble()));
    }
    final _candidate = election.candidateList.where((element) => element.area==userArea).toList();
    final endtime = election.endTime.millisecondsSinceEpoch;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kF5F5F5,
      bottomNavigationBar:
          ((election.startTime.compareTo(DateTime.now())) <= 0) &&
                  ((election.endTime.compareTo(DateTime.now())) >= 0) &&
                  (election.canVote(userID))
              ? GestureDetector(
                  onTap: () {
                    print('Hi');
                  },
                  child: Container(
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
                  ),
                )
              : null,
      body: ListView(
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
                  top: 210,
                  left: deviceSize.width*0.5-80,
                  child: CountdownTimer(
                    endTime: endtime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return Text(
                          'Time ended. Pull to refresh',
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kF8F8EE,
                          ),
                        );
                      }
                      return Text(
                        'Remaining Time: ${time?.hours ?? 0} : ${time?.min ?? 0} : ${time?.sec} ',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: kF8F8EE,
                        ),
                      );
                    },
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
          ListView.builder(itemBuilder:(context, index) => CandidateListView(_candidate[index]) , itemCount: _candidate.length,),
        ],
      ),
    );
  }
}
