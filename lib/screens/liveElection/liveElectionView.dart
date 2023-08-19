import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/candidateModel.dart';
import 'package:oes/models/election_model.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../providers/auth_provider.dart';
import '../../providers/user_provider.dart';
import './candidateList.dart';

// ignore: must_be_immutable
class LiveElectionViewer extends StatefulWidget {
  static String routeName = 'LiveElectionView';
  String selectedCandidate = '0000';

  LiveElectionViewer({super.key});
  @override
  State<LiveElectionViewer> createState() => _LiveElectionViewerState();
}

class _LiveElectionViewerState extends State<LiveElectionViewer> {
  int totalVoters = 0;
  @override
  Widget build(BuildContext context) {
    /**
     * Which Election is user viewing
     */
    final election = ModalRoute.of(context)?.settings.arguments as Election;
    /**
     * User ID of user
     */
    final String userID =
        Provider.of<AuthProvider>(context, listen: false).userId;
    /**
     * User Area
     */
    final String userArea =
        Provider.of<UserProvider>(context, listen: false).userArea(userID);
    int getTotalVoters() {
      election.validFor.forEach((element) {
        totalVoters += Provider.of<UserProvider>(context, listen: false)
            .voterCount(element);
      });
      return totalVoters;
    }

    double percentageCalculator(int casted) {
      return ((casted.toDouble() * 100.00) / (totalVoters.toDouble()));
    }

    /**
     * Candidate List
     */
    final _candidate = election.candidateList
        .where((element) => element.area == userArea)
        .toList();
    final endtime = election.endTime.millisecondsSinceEpoch;
    /**
     * Reload
     */

    bool canVoteUser() {
      if (((election.startTime.compareTo(DateTime.now())) <= 0) &&
          (election.endTime.compareTo(DateTime.now())) >= 0) {
      } else {
        return false;
      }
      if (election.canVote(userID, userArea) == false) {
        return false;
      }
      return true;
    }

    Future<void> _reload() async {
      Future.delayed(Duration(seconds: 2));
      setState(() {
        totalVoters = 0;
        widget.selectedCandidate = '0000';
      });
    }

    bool _isLoading = false;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kF5F5F5,
      /**
       * Cast Vote button
       */
      bottomNavigationBar: canVoteUser()
          ? GestureDetector(
              onTap: () async {
                Candidate choosedCandidate = _candidate.firstWhere((element) =>
                    element.candidateNID == widget.selectedCandidate);
                choosedCandidate.addVote();
                await election.addVoterUserID(userID);
                await _reload();
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
      /**
               * Button Over. Now Display part
               */
      body: LiquidPullToRefresh(
              onRefresh: _reload,
              color: k2CB3CC,
              child: ListView(
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
                                  'Vote Cast : ${election.voterUserId.length - 1}',
                                  style: GoogleFonts.openSansCondensed(
                                    color: kF8F8EE,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Cast Percentage : ${percentageCalculator(election.voterUserId.length - 1).toStringAsFixed(2)}%',
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
                  const SizedBox(
                    height: 20,
                  ),
                  /**
             * Candidate List View
             */
                  ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedCandidate =
                              _candidate[index].candidateNID;
                          totalVoters = 0;
                        });
                      },
                      child: CandidateListView(
                          _candidate[index], widget.selectedCandidate),
                    ),
                    itemCount: _candidate.length,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
    );
  }
}
