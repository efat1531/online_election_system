import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/models/election_model.dart';
import 'package:oes/screens/homeScreen/liveElectionListView.dart';
import 'package:oes/widgets/drawer.dart';
import '../../constants/color_constants.dart';
import '../../providers/user_provider.dart';
import 'finishedElectionListView.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/electionListProvider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<AuthProvider>(context, listen: false).userId;
    final user = Provider.of<UserProvider>(context, listen: false)
        .findUserByUserID(userId);
    final deviceSize = MediaQuery.of(context).size;
    List<Election> _finishedelectionList =
        Provider.of<ElectionList>(context, listen: false)
            .finishedElectionList();
    List<Election> _liveElectionList =
        Provider.of<ElectionList>(context, listen: false).liveElectionList();
    final GlobalKey<ScaffoldState> _globalkey = GlobalKey();

    void reload() {
      print('Relaod');
      setState(() {
        _finishedelectionList =
            Provider.of<ElectionList>(context, listen: false).finishedElectionList();
        _liveElectionList =
            Provider.of<ElectionList>(context, listen: false).liveElectionList();
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
        /**
         * Scaffold Key
         */
        key: _globalkey,
        /**
         * Code for drawer to open
         * 
         */
        drawerEnableOpenDragGesture: false,
        drawer: MainDrawer(),
        /**
         * This container is for Padding around the edges
         */
        body: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 30,
            right: 30,
            bottom: 10,
          ),
          color: kF5F5F5,
          child: ListView(
            shrinkWrap: true,
            children: [
              /**
               * First row for the Drawer Button, Text and Live Election
               */
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _globalkey.currentState?.openDrawer();
                      // print('Here I am');
                    },
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  Text(
                    'Hi @${user.firstName}',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kE51735,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: kE51735,
                    ),
                    padding: const EdgeInsets.only(
                      top: 3,
                      bottom: 3,
                      left: 6,
                      right: 3,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: kFFFFFF,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'LIVE',
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: kFFFFFF,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Elections',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) =>
                    LiveElectionListView(_liveElectionList[index], reload),
                itemCount: _liveElectionList.length,
              ),
              /**
               * Finished Election Text
               */
              Container(
                //color: Colors.red,
                width: deviceSize.width,
                height: 30,
                child: Text(
                  'Finished Elections',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              /**
               * List of Elections
               */
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) =>
                    FinishedElectionListView(_finishedelectionList[index]),
                itemCount: _finishedelectionList.length,
              )
              // Text('${deviceSize.height}'),
              // Text('${deviceSize.width}'),
            ],
          ),
        ),
      ),
    );
  }
}
