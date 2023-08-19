import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:oes/models/candidateModel.dart';
import 'package:oes/models/election_model.dart';
import 'package:oes/providers/electionListProvider.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/constants.dart';
import 'package:intl/intl.dart';
import '../../providers/user_provider.dart';
import './candidateList.dart';
import './imagepicker.dart';

class AddElection extends StatefulWidget {
  static String routeName = '/admin/add_election';
  const AddElection({super.key});

  @override
  State<AddElection> createState() => _AddElectionState();
}

class _AddElectionState extends State<AddElection> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Candidate> candidateList = [];
  List<String> selectedArea = [];
  String electionName = '';
  final _voteAreaItems = voteArea.map((e) => MultiSelectItem(e, e)).toList();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    /**
     * Date Picker
     */
    Future<DateTime?> DatePick() => showDatePicker(
          context: context,
          initialDate: startDate,
          firstDate: startDate,
          lastDate: DateTime(2050),
        );

    /**
     * Time Picker
     */
    Future<TimeOfDay?> TimePick() => showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
    /**
     * Date and Time Pick initialize
     */
    Future pickDateTime(int which) async {
      final selectedDate = await DatePick();
      if (selectedDate == null) return;
      final selectedTime = await TimePick();
      if (selectedTime == null) return;
      setState(() {
        if (which == 1) {
          startDate = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        } else {
          endDate = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        }
      });
    }

    var candidateNidController = TextEditingController();
    var candidatePartController = TextEditingController();
    /**
     * Validate Candidate
     */
    bool validateCandidate() {
      final candidateNid = candidateNidController.text;
      if (candidateNid.length != 10 && candidateNid.length != 13) return false;
      final candidatePartyName = candidatePartController.text;
      final candidateArea = Provider.of<UserProvider>(context, listen: false)
          .candidateArea(candidateNid);
      print('Candidate NID - $candidateNid Candidate area - $candidateArea');
      Candidate newCandidate = Candidate(
        party: candidatePartyName,
        area: candidateArea,
        candidateNID: candidateNid,
        voteCount: 0,
      );
      candidateList.add(newCandidate);
      return true;
    }

    /**
     * Pop up dialougle for candidate Input
     */
    Future showCandidateInput() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            /**
             * Title contain the text needs to be displayed
             */
            title: Text(
              'Add Candidate',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: k3B3B3B,
              ),
            ),
            /**
             * This contain the input feilds
             */
            content: SingleChildScrollView(
              child: Column(
                children: [
                  /**
                   * First input NID Number
                   */
                  Container(
                    height: 30,
                    width: deviceSize.width * 0.80,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Candidate NID',
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: k3B3B3B,
                        ),
                      ),
                      controller: candidateNidController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /**
                   * Second input Party Name
                   */
                  Container(
                    height: 30,
                    width: deviceSize.width * 0.80,
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Party Name',
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: k3B3B3B,
                        ),
                      ),
                      controller: candidatePartController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CandidateIconImage(),
                ],
              ),
            ),
            /**
             * This widget save candidates or cancel
             */
            actions: [
              /**
               * Cancel Button
               */
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kMainColor,
                  ),
                ),
              ),
              /**
               * Submit Button
               */
              TextButton(
                onPressed: () {
                  if (validateCandidate() == false) return;
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kMainColor,
                  ),
                ),
              ),
            ],
          ),
        );
    return Scaffold(
      /**
       * Add candidate bar at bottom
       */
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          await showCandidateInput();
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.only(
            bottom: 10,
            left: 15,
            right: 15,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: k1A2D3A,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'Add Candidate',
            style: GoogleFonts.openSansCondensed(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kCDCDCD,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              height: 100,
              width: deviceSize.width,
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              /**
               * This row handle the top bar elements Back button and Save Button
               */
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    //color: Colors.blue,
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
                  /**
                   * Save Button
                   */
                  Container(
                    alignment: Alignment.centerRight,
                    //color: Colors.blue,
                    width: 100,
                    child: IconButton(
                      icon: const Icon(
                        Icons.save_sharp,
                        size: 25,
                        color: kMainColor,
                      ),
                      onPressed: () async {
                        final isValid = await formkey.currentState?.validate();
                        //print(isValid);
                        if (isValid == false) return;
                        formkey.currentState?.save();
                        final election = Election(
                          id: '123',
                          title: electionName,
                          candidateList: candidateList,
                          validFor: selectedArea,
                          startTime: startDate,
                          endTime: endDate,
                          voterUserId: ['AB'],
                        );
                        try {
                          await Provider.of<ElectionList>(context,
                                  listen: false)
                              .addElection(election);
                        } catch (error) {
                          print(error);
                        }

                        Navigator.of(context)
                            .pushReplacementNamed(AddElection.routeName);
                      },
                    ),
                  )
                ],
              ),
            ),
            /**
             * This form for getting input of the election
             */
            Form(
              key: formkey,
              child: Column(
                children: [
                  /**
                   * Add election text above form
                   */
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10,
                    ),
                    width: deviceSize.width - 80,
                    alignment: Alignment.topCenter,
                    //color: Colors.red,
                    child: Text(
                      'Add Election',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: k3B3B3B,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /**
                   * Name Input
                   */
                  Container(
                    height: deviceSize.height * 0.07,
                    width: deviceSize.width * 0.9,
                    decoration: BoxDecoration(
                      color: kFFFFFF,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: k3B3B3B,
                      ),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          //fontWeight: FontWeight.w400,
                          color: k3B3B3B,
                        ),
                        hintText: 'Election Name',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      keyboardType: TextInputType.name,
                      enableSuggestions: false,
                      autocorrect: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Election Name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        electionName = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /**
                   * Text Start Date and Time
                   */
                  Container(
                    alignment: Alignment.centerLeft,
                    height: deviceSize.height * 0.07,
                    width: deviceSize.width - 60,
                    child: Text(
                      'Start Date and Time:',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: k3B3B3B,
                      ),
                    ),
                  ),
                  /**
                   * Input Start Date and Time
                   */
                  Container(
                    height: deviceSize.height * 0.07,
                    width: (deviceSize.width - 60),
                    color: kFFFFFF,
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 15,
                      left: 15,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: kFFFFFF,
                        elevation: 0,
                      ),
                      onPressed: () => pickDateTime(1),
                      child: Text(
                        "${DateFormat('MMM d, yyyy').format(startDate)} : ${startDate.hour.toString().padLeft(2, '0')} : ${startDate.minute.toString().padLeft(2, '0')}",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: k3B3B3B,
                        ),
                      ),
                    ),
                  ),
                  /**
                   * Text End Date and Time
                   */
                  Container(
                    alignment: Alignment.centerLeft,
                    height: deviceSize.height * 0.07,
                    width: deviceSize.width - 60,
                    child: Text(
                      'End Date and Time:',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: k3B3B3B,
                      ),
                    ),
                  ),
                  /**
                   * Input End Date and Time
                   */
                  Container(
                    height: deviceSize.height * 0.07,
                    width: (deviceSize.width - 60),
                    color: kFFFFFF,
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 15,
                      left: 15,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: kFFFFFF,
                        elevation: 0,
                      ),
                      onPressed: () => pickDateTime(2),
                      child: Text(
                        "${DateFormat('MMM d, yyyy').format(endDate)} : ${endDate.hour.toString().padLeft(2, '0')} : ${endDate.minute.toString().padLeft(2, '0')}",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: k3B3B3B,
                        ),
                      ),
                    ),
                  ),
                  /**
                   * Area selection
                   */
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: MultiSelectDialogField(
                      items: _voteAreaItems,
                      title: Text(
                        'Select Area',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: k3B3B3B,
                        ),
                      ),
                      selectedColor: k1D4860,
                      decoration: const BoxDecoration(
                        color: kFFFFFF,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: kMainColor,
                      ),
                      buttonText: Text(
                        "Area Selection",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: k3B3B3B,
                        ),
                      ),
                      onConfirm: (results) {
                        selectedArea = results;
                      },
                    ),
                  ),
                ],
              ),
            ),
            /**
             * Display List of Candidate
             */
            ListView.builder(
              itemBuilder: (context, index) =>
                  CandidateListView(candidateList[index]),
              itemCount: candidateList.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
