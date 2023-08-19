class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final DateTime dateofbirth;
  final String nid;
  final String district;
  final String division;
  final String gender;
  final String userRole;
  final String electionArea;
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
    required this.userRole,
    required this.electionArea,
  });
}
