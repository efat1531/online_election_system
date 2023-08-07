import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../models/election_model.dart';
import '../../providers/user_provider.dart';
import '../../screens/liveElection/liveElectionView.dart';

class LiveElectionListView extends StatefulWidget {
  final Election _election;
  final Function reload;
  LiveElectionListView(this._election, this.reload);

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

    int endtime = widget._election.endTime.millisecondsSinceEpoch;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(LiveElectionViewer.routeName,
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
              Center(
                child: CountdownTimer(
                  endTime: endtime,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return Text(
                        'Time ended. Pull to refresh',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: k929090,
                        ),
                      );
                    }
                    return Text(
                      'Remaining Time: ${time?.hours ?? 0} : ${time?.min ?? 0} : ${time?.sec} ',
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
