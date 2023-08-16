import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color_constants.dart';

class AddElection extends StatefulWidget {
  static String routeName = '/admin/add_election';
  const AddElection({super.key});

  @override
  State<AddElection> createState() => _AddElectionState();
}

class _AddElectionState extends State<AddElection> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: deviceSize.width,
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.keyboard_double_arrow_left_rounded,
                              size: 25,
                              color: kF8F8EE,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 36,
                          child: Text(
                            'Back',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kF8F8EE,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    color: Colors.blue,
                    width: 100,
                    child: IconButton(
                      icon: const Icon(
                        Icons.save_sharp,
                        size: 25,
                        color: kF8F8EE,
                      ),
                      onPressed: () {
                        print('Do Nothing now');
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
