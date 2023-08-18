import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../screens/addElectionScreen/addElection.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userID = Provider.of<AuthProvider>(context).userId;
    final userDetails =
        Provider.of<UserProvider>(context).findUserByUserID(userID);
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height,
      width: deviceSize.width - 70,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 350,
            //width: deviceSize.width - 70,
            color: Colors.red,
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFe0f2f1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddElection.routeName);
            },
            child: Text('Add Election'),
          )
        ],
      ),
    );
  }
}
