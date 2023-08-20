import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../models/election_model.dart';
import '../../providers/user_provider.dart';
import './upcomingElectionDetails.dart';

class UpcomingListViewBuilder extends StatefulWidget {
  final Election _election;
  final Function reload;
  const UpcomingListViewBuilder(this._election, this.reload);

  @override
  State<UpcomingListViewBuilder> createState() =>
      _UpcomingListViewBuilderState();
}

class _UpcomingListViewBuilderState extends State<UpcomingListViewBuilder> {
  int totalVoters = 0;
  @override
  Widget build(BuildContext context) {
    void totalVotersCount() {
      widget._election.validFor.forEach((element) {
        totalVoters += Provider.of<UserProvider>(context, listen: false)
            .voterCount(element);
      });
    }

    double castPercentCalculator(int casted) {
      totalVotersCount();
      double percentage = (casted.toDouble() / totalVoters.toDouble()) * 100;
      return percentage;
    }

    int endtime = widget._election.startTime.millisecondsSinceEpoch;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(UpcomingElectionDetails.routename,
            arguments: widget._election);
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
                      'Vote Casted: ${widget._election.voterUserId.length - 1}',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    ),
                    Text(
                      'Cast Percentage: ${castPercentCalculator(widget._election.voterUserId.length - 1).toStringAsFixed(2)}%',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: CountdownTimer(
                  endTime: endtime,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return Text(
                        'Election Started. Pull to refresh',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: k929090,
                        ),
                      );
                    }
                    return Text(
                      'Remaining Time to Start: ${time.hours == null ? '00' : time.hours.toString().padLeft(2, '0')} : ${time.min == null ? '00' : time.min.toString().padLeft(2, '0')} : ${time.sec == null ? '00' : time.sec.toString().padLeft(2, '0')}',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
