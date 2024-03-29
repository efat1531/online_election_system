import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constant.dart';
import 'dart:convert';
import '../models/nid_model.dart';

class NidListProvider with ChangeNotifier {
  List<NID> _nidList = [
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
      district: "",
      division: "",
      gender: "",
      electionArea: '',
    );
  }

  bool checkNid(String unidNumber) {
    var nid = _nidList.where((element) => element.nidNumber == unidNumber);
    if (nid.isEmpty) return true;
    return false;
  }

  Future<void> addNId(NID _receivedNid) async {
    final url = Uri.https(
        election_api,
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
          'electionArea':_receivedNid.electionArea,
        }),
      );
      _nidList.add(_receivedNid);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchNidData() async {
    final url = Uri.https(
        election_api,
        '/nidList.json');
    try {
      final response = await http.get(url);
      if (jsonDecode(response.body) == null) return;
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      final List<NID> loadedNid = [];
      extractedData.forEach((key, value) {
        loadedNid.add(
          NID(
            name: value['name'],
            nidNumber: value['nidNumber'],
            nidPin: value['nidPin'],
            dateOfBirth: DateTime.parse(value['dateOfBirth']),
            address: value['address'],
            district: value['district'],
            division: value['division'],
            gender: value['gender'],
            electionArea: value['electionArea'],
          ),
        );
      });
      _nidList = loadedNid;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
