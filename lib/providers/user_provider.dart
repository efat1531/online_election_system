import 'package:flutter/material.dart';
import '../models/user_description.dart';
import '../models/enum_conversion.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [];

  bool newUser(String nidNumber) {
    var nidUser = _users.where((element) => element.nid == nidNumber);
    return nidUser.isNotEmpty;
  }

  Future<void> addUser(UserModel _receivedData) async {
    final enumConvert = eNumConvert();
    final url = Uri.https(
        'online-election-system-fb9f4-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/users.json');
    try {
      final response = await http.post(
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
            'district': enumConvert.districtConversion(_receivedData.district),
            'divison': enumConvert.divisionConversion(_receivedData.division),
            'gender': enumConvert.genderConversion(_receivedData.gender),
          },
        ),
      );
      print(json.decode(response.body));
      _users.add(_receivedData);
    } catch (error) {
      rethrow;
    }
  }
}
