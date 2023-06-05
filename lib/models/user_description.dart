class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final DateTime dateofbirth;
  final String nid;
  UserModel({
    required this.nid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateofbirth,
    required this.phone,
  });
}
