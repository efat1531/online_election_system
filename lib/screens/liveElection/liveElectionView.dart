import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/election_model.dart';

class LiveElectionViewer extends StatefulWidget {
  static String routeName = 'LiveElectionView';
  @override
  State<LiveElectionViewer> createState() => _LiveElectionViewerState();
}

class _LiveElectionViewerState extends State<LiveElectionViewer> {
  @override
  Widget build(BuildContext context) {
    final _election = ModalRoute.of(context)!.settings.arguments as Election;
    return Scaffold(
      body: Center(
        child: Text(
          _election.title,
          style: GoogleFonts.openSans(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
