import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';
import '../../providers/user_provider.dart';
import './listviewBuilder.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/electionListProvider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<AuthProvider>(context).userId;
    final user = Provider.of<UserProvider>(context).findUserByUserID(userId);
    final deviceSize = MediaQuery.of(context).size;
    final electionList = Provider.of<ElectionList>(context).electionList;
    return Scaffold(
      /**
       * This container is for Padding around the edges
       */
      body: Container(
        padding: const EdgeInsets.only(
          top: 35,
          left: 30,
          right: 30,
        ),
        color: kF5F5F5,
        child: Column(
          children: [
            /**
             * First row for the Drawer Button, Text and Live Election
             */
            Row(
              children: [
                IconButton(
                  onPressed: () {},
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
                    fontSize: 13,
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
            /**
             * List of Elections
             */
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => FinishedElectionListView(electionList[index]),
                itemCount: electionList.length,
              ),
            )
            // Text('${deviceSize.height}'),
            // Text('${deviceSize.width}'),
          ],
        ),
      ),
    );
  }
}
