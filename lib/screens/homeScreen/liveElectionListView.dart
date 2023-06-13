import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../models/election_model.dart';
import '../../providers/user_provider.dart';
import './countDownTimer.dart';

class LiveElectionListView extends StatefulWidget {
  final Election _election;
  LiveElectionListView(this._election);

  @override
  State<LiveElectionListView> createState() => _LiveElectionListViewState();
}

class _LiveElectionListViewState extends State<LiveElectionListView> {
  @override
  Widget build(BuildContext context) {
    double castPercentCalculator(int casted) {
      int totalVoters = Provider.of<UserProvider>(context)
          .voterCount(widget._election.validFor);
      double percentage = (casted.toDouble() / totalVoters.toDouble()) * 100;
      return percentage;
    }

    int secondsRemaining() {
      int remaining =
          widget._election.endTime.difference(DateTime.now()).inSeconds;
      return remaining;
    }

    bool hasTimerStopped = false;
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed();
      },
      child: SizedBox(
        height: 160,
        child: Card(
          margin: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: kMainColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                  right: 10,
                  left: 10,
                ),
                // color: Colors.red,
                height: 50,
                child: Text(
                  widget._election.title,
                  maxLines: 2,
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kFFFFFF,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MMM dd, yyyy')
                          .format(widget._election.startTime),
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kAFBABD,
                      ),
                    ),
                    Text(
                      'Candidates: ${widget._election.candidateList.length}',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kAFBABD,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 8,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vote Casted: ${widget._election.voterUserId.length}',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    ),
                    Text(
                      'Cast Percentage: ${castPercentCalculator(widget._election.voterUserId.length)}%',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
