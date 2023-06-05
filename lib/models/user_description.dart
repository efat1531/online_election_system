import '../models/nid_model.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final DateTime dateofbirth;
  final String nid;
  final Districts district;
  final Division division;
  final Gender gender;
  final String userRole;
  UserModel({
    required this.nid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateofbirth,
    required this.phone,
    required this.district,
    required this.division,
    required this.gender,
    this.userRole = "Citizen",
  });
}
