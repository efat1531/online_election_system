import 'package:flutter/material.dart';
import '../models/user_description.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  Map<String, UserModel> _users = {};

  bool newUser(String nidNumber) {
    var nidUserList = _users.values.toList();
    var nidUser = nidUserList.where((element) => element.nid == nidNumber);
    if (nidUser.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> addUser(UserModel _receivedData, String userId) async {
    final url = Uri.https(
        'online-election-system-fb9f4-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/users.json');
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'firstName': _receivedData.firstName,
            'lastName': _receivedData.lastName,
            'email': _receivedData.email,
            'phone': _receivedData.phone,
            'dateofBirth': _receivedData.dateofbirth.toIso8601String(),
            'nid': _receivedData.nid,
            'userRole': _receivedData.userRole,
            'district': _receivedData.district,
            'divison': _receivedData.division,
            'gender': _receivedData.gender,
            'user_id': userId,
            'election_area':_receivedData.electionArea,
          },
        ),
      );
      _users.addAll({
        userId: _receivedData,
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchUsersData() async {
    final url = Uri.https(
        'online-election-system-fb9f4-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/users.json');
    try {
      final response = await http.get(url);
      if (jsonDecode(response.body) == null) return;
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      Map<String, UserModel> loadedData = {};
      extractedData.forEach((key, value) {
        loadedData.addAll({
          value['user_id']: UserModel(
            nid: value['nid'],
            firstName: value['firstName'],
            lastName: value['lastName'],
            email: value['email'],
            dateofbirth: DateTime.parse(value['dateofBirth']),
            phone: value['phone'],
            district: value['district'],
            division: value['divison'],
            gender: value['gender'],
            electionArea: value['electionArea'],
          ),
        });
      });
      _users = loadedData;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  UserModel findUserByUserID(String userId) {
    MapEntry entry =
        _users.entries.firstWhere((element) => element.key == userId);
    return entry.value;
  }

  int voterCount(String area) {
    if (area == 'All') {
      return _users.length;
    } else {
      final howMany = _users.values.where(
          (element) => element.district.toLowerCase() == area.toLowerCase());
      return howMany.length;
    }
  }
}
