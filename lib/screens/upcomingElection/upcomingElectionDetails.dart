import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants.dart';
import '../../models/candidateModel.dart';
import '../../models/election_model.dart';
import '../../providers/user_provider.dart';
import './candidateList.dart';

class UpcomingElectionDetails extends StatefulWidget {
  static String routename = '/admin/upcoming_election_details';
  const UpcomingElectionDetails({super.key});

  @override
  State<UpcomingElectionDetails> createState() =>
      _UpcomingElectionDetailsState();
}

class _UpcomingElectionDetailsState extends State<UpcomingElectionDetails> {
  Future<void> _reload() async {
    Future.delayed(Duration(seconds: 2));
    setState(() {
      totalVoters = 0;
    });
  }

  int totalVoters = 0;
  @override
  Widget build(BuildContext context) {
    final election = ModalRoute.of(context)?.settings.arguments as Election;
    final endtime = election.startTime.millisecondsSinceEpoch;
    final deviceSize = MediaQuery.of(context).size;
    int getTotalVoters() {
      election.validFor.forEach((element) {
        totalVoters += Provider.of<UserProvider>(context, listen: false)
            .voterCount(element);
      });
      return totalVoters;
    }

    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _reload,
        color: k2CB3CC,
        child: Column(
          children: [
            Container(
              color: kMainColor,
              height: deviceSize.height * 0.36,
              width: deviceSize.width,
              child: Stack(
                children: [
                  /**
                   * Back Button
                   */
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
                  /**
                   * Election Details
                   */
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
                  /**
                   * Title
                  */
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
                  /**
                   * Total voters
                   */
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
                        'Total Voters : ${getTotalVoters()}',
                        style: GoogleFonts.openSansCondensed(
                          color: kF8F8EE,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  /**
                   * Time remaining
                   */
                  Positioned(
                    top: 210,
                    left: deviceSize.width * 0.5 - 80,
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
                          'Remaining Time: ${time.hours == null ? '00' : time.hours.toString().padLeft(2, '0')} : ${time.min == null ? '00' : time.min.toString().padLeft(2, '0')} : ${time.sec == null ? '00' : time.sec.toString().padLeft(2, '0')}',
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kF8F8EE,
                          ),
                        );
                      },
                    ),
                  ),
                  /**
                   * Vote Casted & Percentage
                   */
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
                            'Vote Cast : 00',
                            style: GoogleFonts.openSansCondensed(
                              color: kF8F8EE,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cast Percentage : 00.00%',
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
            /**
             * Candidate List View
             */
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
                        child: (_newList.length == 0)
                            ? null
                            : Text(
                                voteArea[index],
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) => UpcomingCandidateListView(
                            _newList[index]),
                        itemCount: _newList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        //physics: const AlwaysScrollableScrollPhysics(),
                      ),
                    ],
                  );
                },
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: voteArea.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
