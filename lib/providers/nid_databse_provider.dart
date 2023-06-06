import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/nid_model.dart';

class NidListProvider with ChangeNotifier {
  final _nidList = [
    NID(
      name: 'Abu Hafiz',
      nidNumber: '1234567890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Dhaka.name,
      division: Division.Dhaka.name,
      gender: Gender.Male.name,
    ),
    NID(
      name: 'Saheda Khatun',
      nidNumber: '1234567990',
      nidPin: '123466',
      dateOfBirth: DateTime(1991, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur.name,
      division: Division.Dhaka.name,
      gender: Gender.Female.name,
    ),
    NID(
      name: 'Ashraf Khan',
      nidNumber: '1234569890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur.name,
      division: Division.Dhaka.name,
      gender: Gender.Male.name,
    ),
    NID(
      name: 'Salina Hossain',
      nidNumber: '1234597890',
      nidPin: '123456',
      dateOfBirth: DateTime(1990, 12, 11),
      address: 'Rajabari,Sreepur',
      district: Districts.Gazipur.name,
      division: Division.Dhaka.name,
      gender: Gender.Female.name,
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
      district: Districts.Gazipur.name,
      division: Division.Dhaka.name,
      gender: Gender.Female.name,
    );
  }

  bool checkNid(String unidNumber) {
    var nid = _nidList.where((element) => element.nidNumber == unidNumber);
    if (nid.isEmpty) return true;
    return false;
  }

  Future<void> addNId(NID _receivedNid) async {
    final url = Uri.https(
        'online-election-system-fb9f4-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/nidList.json');
    try {
      await http.post(
        url,
        body: json.encode({
          'name': _receivedNid.name,
          'nidNumber': _receivedNid.nidNumber,
          'nidPin': _receivedNid.nidPin,
          'dateOfBirth': _receivedNid.dateOfBirth.toIso8601String(),
          'address': _receivedNid.address,
          'district': _receivedNid.district,
          'division': _receivedNid.division,
          'gender': _receivedNid.gender,
        }),
      );
      _nidList.add(_receivedNid);
    } catch (error) {
      rethrow;
    }
  }
}
