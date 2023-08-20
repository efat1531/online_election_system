import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oes/constants/color_constants.dart';
import 'package:oes/screens/homeScreen/homeScreen.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../screens/addElectionScreen/addElection.dart';
import '../screens/nidAddScreen/nidaddScreen.dart';
import '../screens/loginScreen/login_screen.dart';
import '../screens/liveElectionScreen/liveElectionListView.dart';
import '../screens/finishedElectionListScreen/finishedElectionList.dart';
import '../screens/upcomingElection/upcomingElectionList.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userID = Provider.of<AuthProvider>(context).userId;
    final userDetails =
        Provider.of<UserProvider>(context).findUserByUserID(userID);
    final deviceSize = MediaQuery.of(context).size;

    bool checkUserRole() {
      //print(userDetails.userRole);
      if (userDetails.userRole == 'Admin') return true;
      return false;
    }

    Future showSignoutAlert() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Signout',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kE51735,
              ),
            ),
            content: RichText(
              text: TextSpan(
                text: 'Do you really want to ',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: k1A2D3A,
                ),
                children: [
                  TextSpan(
                    text: 'Sign-Out?',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.red[600],
                    ),
                  ),
                  TextSpan(
                    text: ' If you want, press "',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: k1A2D3A,
                    ),
                  ),
                  TextSpan(
                    text: 'Confirm',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kE51735,
                    ),
                  ),
                  TextSpan(
                    text: '".',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: k1A2D3A,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kMainColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await Provider.of<AuthProvider>(context, listen: false)
                      .signout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (route) => false);
                },
                child: Text(
                  'Confirm',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kE51735,
                  ),
                ),
              ),
            ],
          ),
        );
    return Container(
      height: deviceSize.height,
      width: deviceSize.width - 70,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 280,
            width: deviceSize.width - 70,
            //color: Colors.red,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    'assets/svg/drawerBG-cropped.svg',
                    height: 270,
                    width: deviceSize.width - 70,
                    //fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  right: 55,
                  top: 110,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color(0xFFe0f2f1),
                    ),
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/bn/thumb/c/c9/%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B6_%E0%A6%A8%E0%A6%BF%E0%A6%B0%E0%A7%8D%E0%A6%AC%E0%A6%BE%E0%A6%9A%E0%A6%A8_%E0%A6%95%E0%A6%AE%E0%A6%BF%E0%A6%B6%E0%A6%A8%E0%A7%87%E0%A6%B0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.svg/512px-%E0%A6%AC%E0%A6%BE%E0%A6%82%E0%A6%B2%E0%A6%BE%E0%A6%A6%E0%A7%87%E0%A6%B6_%E0%A6%A8%E0%A6%BF%E0%A6%B0%E0%A7%8D%E0%A6%AC%E0%A6%BE%E0%A6%9A%E0%A6%A8_%E0%A6%95%E0%A6%AE%E0%A6%BF%E0%A6%B6%E0%A6%A8%E0%A7%87%E0%A6%B0_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.svg.png'),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  child: Text(
                    '${userDetails.firstName} ${checkUserRole() ? ' ' : userDetails.lastName}',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kFFFFFF,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Text(
                    'NID: ${userDetails.nid}',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kCDCDCD,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  child: Text(
                    'Area: ${userDetails.electionArea}',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kCDCDCD,
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 20,
                  child: Text(
                    'Address: ${userDetails.district}, ${userDetails.division}',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kCDCDCD,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: kMainColor,
          ),
          /**
           * Home Button
           */
          Container(
            height: 50,
            width: deviceSize.width - 70,
            //color: Colors.red,
            child: ListTile(
              horizontalTitleGap: 6.0,
              leading: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: k1A2D3A,
                ),
                child: const Icon(
                  Icons.home_sharp,
                  size: 30,
                  color: kFFFFFF,
                ),
              ),
              title: Text(
                'Home',
                style: GoogleFonts.openSansCondensed(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName, (route) => false);
              },
            ),
          ),
          const Divider(
            thickness: 1,
            color: kMainColor,
          ),
          /**
           * Live Election Screen
           */
          Container(
            height: 50,
            width: deviceSize.width - 70,
            //color: Colors.red,
            child: ListTile(
              horizontalTitleGap: 6.0,
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kE51735,
                ),
                child: const Icon(
                  Icons.live_tv_rounded,
                  size: 30,
                  color: kFFFFFF,
                ),
              ),
              title: Text(
                'Live Elections',
                style: GoogleFonts.openSansCondensed(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(LiveElectionListViewScreen.routename);
              },
            ),
          ),
          const Divider(
            thickness: 1,
            color: kMainColor,
          ),
          /**
           * Finished Election Button
           */
          Container(
            height: 50,
            width: deviceSize.width - 70,
            //color: Colors.red,
            child: ListTile(
              horizontalTitleGap: 6.0,
              leading: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: k1A2D3A,
                ),
                child: const Icon(
                  Icons.done_all_rounded,
                  size: 30,
                  color: kFFFFFF,
                ),
              ),
              title: Text(
                'Finished Elections',
                style: GoogleFonts.openSansCondensed(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(FinishedElectionScreen.routename);
              },
            ),
          ),
          const Divider(
            thickness: 1,
            color: kMainColor,
          ),
          checkUserRole()
              ? Container(
                  height: 50,
                  width: deviceSize.width - 70,
                  //color: Colors.red,
                  child: ListTile(
                    horizontalTitleGap: 6.0,
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: k1A2D3A,
                      ),
                      child: const Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: kFFFFFF,
                      ),
                    ),
                    title: Text(
                      'Add NID',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(NidAddScreen.routeName);
                    },
                  ),
                )
              : const SizedBox.shrink(),
          checkUserRole()
              ? const Divider(
                  thickness: 1,
                  color: kMainColor,
                )
              : const SizedBox.shrink(),
          checkUserRole()
              ? Container(
                  height: 50,
                  width: deviceSize.width - 70,
                  //color: Colors.red,
                  child: ListTile(
                    horizontalTitleGap: 6.0,
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: k1A2D3A,
                      ),
                      child: const Icon(
                        Icons.add_moderator_outlined,
                        size: 30,
                        color: kFFFFFF,
                      ),
                    ),
                    title: Text(
                      'Add Election',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(AddElection.routeName);
                    },
                  ),
                )
              : const SizedBox.shrink(),
          checkUserRole()
              ? const Divider(
                  thickness: 1,
                  color: kMainColor,
                )
              : const SizedBox.shrink(),
          checkUserRole()
              ? Container(
                  height: 50,
                  width: deviceSize.width - 70,
                  //color: Colors.red,
                  child: ListTile(
                    horizontalTitleGap: 6.0,
                    leading: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: k1A2D3A,
                      ),
                      child: const Icon(
                        Icons.watch_later_outlined,
                        size: 30,
                        color: kFFFFFF,
                      ),
                    ),
                    title: Text(
                      'Upcoming Elections',
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(UpcomingElectionListView.routename);
                    },
                  ),
                )
              : const SizedBox.shrink(),
          checkUserRole()
              ? const Divider(
                  thickness: 1,
                  color: kMainColor,
                )
              : const SizedBox.shrink(),
          Flexible(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: deviceSize.width - 70,
                    height: 110,
                    child: SvgPicture.asset(
                      'assets/svg/DrawerUnder.svg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 150,
                    //color: Colors.amber,
                    child: ListTile(
                      horizontalTitleGap: 6.0,
                      leading: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: k1A2D3A,
                        ),
                        child: const Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: kFFFFFF,
                        ),
                      ),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kCDCDCD,
                        ),
                      ),
                      onTap: () async {
                        showSignoutAlert();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
