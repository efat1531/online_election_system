import 'package:flutter/material.dart';

import '../models/nid_model.dart';

class NidListProvider with ChangeNotifier {
  final _nidList = [
    NID(
      name: 'Abu Hafiz',
      nidNumber: '1234567890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Dhaka,
      division: Division.Dhaka,
      gender: Gender.Male,
    ),
    NID(
      name: 'Saheda Khatun',
      nidNumber: '1234567990',
      nidPin: '123466',
      dateOfBirth: DateTime(1991, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur,
      division: Division.Dhaka,
      gender: Gender.Female,
    ),
    NID(
      name: 'Ashraf Khan',
      nidNumber: '1234569890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur,
      division: Division.Dhaka,
      gender: Gender.Male,
    ),
    NID(
      name: 'Salina Hossain',
      nidNumber: '1234597890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur,
      division: Division.Dhaka,
      gender: Gender.Female,
    ),
  ];

  NID varificationNID(String unidNumber, String unidPIN, DateTime udob) {
    var userData =
        _nidList.firstWhere((element) => element.nidNumber == unidNumber);
    if (userData.nidPin == unidPIN && udob == userData.dateOfBirth) {
      return userData;
    }
    return NID(
      name: '',
      nidNumber: '',
      nidPin: '',
      dateOfBirth: DateTime(1990, 12, 11),
      address: '',
      district: Districts.Gazipur,
      division: Division.Dhaka,
      gender: Gender.Female,
    );
  }
}
