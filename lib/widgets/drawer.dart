import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

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
            height: 300,
            width: deviceSize.width - 70,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/svg/drawerBG.svg',
                  height: 300,
                  width: deviceSize.width - 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
