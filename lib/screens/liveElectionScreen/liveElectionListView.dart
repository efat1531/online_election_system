import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../providers/electionListProvider.dart';
import '../homeScreen/liveElectionListView.dart';

class LiveElectionListViewScreen extends StatefulWidget {
  static String routename = '/viewLiveElectionListView';
  const LiveElectionListViewScreen({super.key});

  @override
  State<LiveElectionListViewScreen> createState() =>
      _LiveElectionListViewScreenState();
}

class _LiveElectionListViewScreenState
    extends State<LiveElectionListViewScreen> {
  @override
  Widget build(BuildContext context) {
    var electionList =
        Provider.of<ElectionList>(context, listen: false).liveElectionList();
    final deviceSize = MediaQuery.of(context).size;

    void reload() {
      setState(() {
        electionList = Provider.of<ElectionList>(context, listen: false)
            .liveElectionList();
      });
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        reload();
      },
      child: Scaffold(
        backgroundColor: kF5F5F5,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
              bottom: 10,
            ),
            color: kF5F5F5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  //color: Colors.blue,
                  //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Stack(
                    children: [
                      /**
                         * Back Button
                         */
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.keyboard_double_arrow_left_rounded,
                            size: 25,
                            color: kMainColor,
                          ),
                        ),
                      ),
                      /**
                         * Back Text
                         */
                      Positioned(
                        top: 15,
                        left: 36,
                        child: Text(
                          'Back',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //color: Colors.red,
                  width: deviceSize.width,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    'Live Elections',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) =>
                      LiveElectionListView(electionList[index], reload),
                  itemCount: electionList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
