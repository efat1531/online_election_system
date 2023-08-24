// ignore_for_file: slash_for_doc_comments


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/httpException.dart';
import '../constants/api_constant.dart';

class AuthProvider with ChangeNotifier {
  late String _userID;
  /**
   * SignUp Function for User
   */
  Future<void> signup(String email, String password) async {
    final url = Uri.parse(signUp_api);
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = jsonDecode(response.body);
      _userID = responseData['localId'];
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signin(String email, String password) async {
    final url = Uri.parse(signIn_api);
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      } else {
        _userID = responseData['localId'];
      }
    } catch (error) {
      rethrow;
    }

    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(credential);
  }

  String get userId {
    return _userID;
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
