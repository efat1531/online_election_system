class NID {
  final String nidNumber;
  final String nidPin;
  final String name;
  //final String imageURL;
  final DateTime dateOfBirth;
  final String district;
  final String division;
  final String address;
  final String gender;
  final String electionArea;

  NID({
    required this.name,
    required this.nidNumber,
    required this.nidPin,
    required this.dateOfBirth,
    required this.address,
    required this.district,
    required this.division,
    //required this.imageURL
    required this.gender,
    required this.electionArea,
  });
}
