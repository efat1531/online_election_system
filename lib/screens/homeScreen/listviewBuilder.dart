import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../models/election_model.dart';
import '../../providers/user_provider.dart';

class FinishedElectionListView extends StatelessWidget {
  final Election electionModel;
  const FinishedElectionListView(this.electionModel, {super.key});

  @override
  Widget build(BuildContext context) {
    double castPercentCalculator(int casted) {
      int totalVoters =
          Provider.of<UserProvider>(context).voterCount(electionModel.validFor);
      double percentage = (casted.toDouble() / totalVoters.toDouble()) * 100;
      return percentage;
    }

    return GestureDetector(
      onTap: () {
        print(electionModel.id);
      },
      child: SizedBox(
        height: 130,
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
                  electionModel.title,
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
                          .format(electionModel.startTime),
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kAFBABD,
                      ),
                    ),
                    Text(
                      'Candidates: ${electionModel.candidateList.length}',
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
                      'Vote Casted: ${electionModel.voterUserId.length}',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: k929090,
                      ),
                    ),
                    Text(
                      'Cast Percentage: ${castPercentCalculator(electionModel.voterUserId.length)}%',
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
  }
}
