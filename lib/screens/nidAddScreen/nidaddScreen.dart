// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oes/providers/nid_databse_provider.dart';
import 'package:oes/screens/nidAddScreen/customDropDownList.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../models/nid_model.dart';
import './error_dialouge.dart';

class NidAddScreen extends StatefulWidget {
  static String routeName = '/admin/nid_registration';
  const NidAddScreen({super.key});

  @override
  State<NidAddScreen> createState() => _NidAddScreenState();
}

class _NidAddScreenState extends State<NidAddScreen> {
  List<String> disValues = Districts.values.map((e) => e.name).toList();
  List<String> divValues = Division.values.map((e) => e.name).toList();
  List<String> genValues = Gender.values.map((e) => e.name).toList();
  String? selectedDisValue, selectedGenValue, selectedDivValue;

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  NID _userNID = NID(
    name: '',
    nidNumber: '',
    nidPin: '',
    dateOfBirth: DateTime(1990, 12, 11),
    address: '',
    district: Districts.Gazipur.name,
    division: Division.Dhaka.name,
    gender: Gender.Female.name,
  );
  /**
   * Date Time Fucntion
   */
  DateTime _selectedDate = DateTime.parse('0000-00-00');
  void _showDateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1965),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: kMainColor,
                backgroundColor: kF5F5F5,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                color: kF5F5F5,
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
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
                          'NID Registration',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: k3B3B3B,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Full Name Input
                 */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
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
                            hintText: 'Full Name',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.name,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Full Name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _userNID = NID(
                              name: newValue!,
                              nidNumber: _userNID.nidNumber,
                              nidPin: _userNID.nidPin,
                              dateOfBirth: _selectedDate,
                              address: _userNID.address,
                              district: _userNID.district,
                              division: _userNID.division,
                              gender: _userNID.gender,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Nid Number
                 */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
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
                            hintText: 'NID Number',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter NID Number';
                            } else if (value.length != 10 &&
                                value.length != 13) {
                              return 'Wrong NID Number. Length should be 10 or 13';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _userNID = NID(
                              name: _userNID.name,
                              nidNumber: newValue!,
                              nidPin: _userNID.nidPin,
                              dateOfBirth: _selectedDate,
                              address: _userNID.address,
                              district: _userNID.district,
                              division: _userNID.division,
                              gender: _userNID.gender,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * NID Pin
                 */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
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
                            hintText: 'NID Pin Number',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          obscureText: true,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter NID Pin';
                            } else if (value.length < 4) {
                              return 'Minimum pin length should be 4';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _userNID = NID(
                              name: _userNID.name,
                              nidNumber: _userNID.nidNumber,
                              nidPin: newValue!,
                              dateOfBirth: _selectedDate,
                              address: _userNID.address,
                              district: _userNID.district,
                              division: _userNID.division,
                              gender: _userNID.gender,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Date Time Picker
                 */
                      Stack(
                        children: [
                          Container(
                            height: deviceSize.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kFFFFFF,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.only(
                              top: 17,
                              bottom: 15,
                              left: 15,
                            ),
                            child: Text(
                              //'12 Dec 2023',
                              _selectedDate == DateTime.parse('0000-00-00')
                                  ? 'Date of Birth'
                                  : DateFormat('MMM d, yyyy')
                                      .format(_selectedDate),
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: k3B3B3B,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 7,
                            child: IconButton(
                              onPressed: () {
                                _showDateTimePicker();
                              },
                              icon: const Icon(
                                Icons.calendar_month_outlined,
                                color: kMainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Address Picker
                 */
                      Container(
                        height: deviceSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: kFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
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
                            hintText: 'Enter Address',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          keyboardType: TextInputType.streetAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Address';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _userNID = NID(
                              name: _userNID.name,
                              nidNumber: _userNID.nidNumber,
                              nidPin: _userNID.nidPin,
                              dateOfBirth: _selectedDate,
                              address: newValue!,
                              district: _userNID.district,
                              division: _userNID.division,
                              gender: _userNID.gender,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * District Picker
                 */
                      CustomDropdownButton2(
                        hint: 'Select District',
                        dropdownItems: disValues,
                        value: selectedDisValue,
                        onChanged: (value) {
                          setState(() {
                            selectedDisValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Divison
                 */
                      CustomDropdownButton2(
                        hint: 'Select Division',
                        dropdownItems: divValues,
                        value: selectedDivValue,
                        onChanged: (value) {
                          setState(() {
                            selectedDivValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /**
                 * Gender
                 */
                      CustomDropdownButton2(
                        hint: 'Select Gender',
                        dropdownItems: genValues,
                        value: selectedGenValue,
                        onChanged: (value) {
                          setState(() {
                            selectedGenValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool isValid = _formKey.currentState!.validate();
                          print(isValid);
                          if (!isValid) return;
                          if (selectedDisValue == null ||
                              selectedDivValue == null ||
                              selectedGenValue == null) return;
                          if (_selectedDate == DateTime.parse('0000-00-00'))
                            return;
                          _formKey.currentState!.save();
                          _userNID = NID(
                            name: _userNID.name,
                            nidNumber: _userNID.nidNumber,
                            nidPin: _userNID.nidPin,
                            dateOfBirth: _selectedDate,
                            address: _userNID.address,
                            district: selectedDisValue!,
                            division: selectedDivValue!,
                            gender: selectedGenValue!,
                          );
                          bool newNid = Provider.of<NidListProvider>(context,
                                  listen: false)
                              .checkNid(_userNID.nidNumber);
                          if (newNid == true) {
                            setState(() {
                              _isLoading = true;
                            });
                            await Provider.of<NidListProvider>(context,
                                    listen: false)
                                .addNId(_userNID);
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.of(context)
                                .pushReplacementNamed(NidAddScreen.routeName);
                          } else {
                            String errorMessage =
                                'This National ID card is already register to the system.';
                            showDialog(
                              context: context,
                              builder: (context) => ErrorDialouge(errorMessage),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width - 40,
                          height: deviceSize.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kMainColor,
                          ),
                          child: Text(
                            'Save User',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kFFFFFF,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
