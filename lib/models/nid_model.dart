enum Division {
  Dhaka,
  Barishal,
  Chittagong,
  Khulna,
  Mymensingh,
  Rajshahi,
  Sylhet,
  Rangpur,
}

enum Districts {
  Dhaka,
  Faridpur,
  Gazipur,
  Gopalganj,
  Jamalpur,
  Kishoreganj,
  Madaripur,
  Manikganj,
  Munshiganj,
  Mymensingh,
  Narayanganj,
  Narsingdi,
  Netrokona,
  Rajbari,
  Shariatpur,
  Sherpur,
  Tangail,
  Bogra,
  Joypurhat,
  Naogaon,
  Natore,
  Nawabganj,
  Pabna,
  Rajshahi,
  Sirajgonj,
  Dinajpur,
  Gaibandha,
  Kurigram,
  Lalmonirhat,
  Nilphamari,
  Panchagarh,
  Rangpur,
  Thakurgaon,
  Barguna,
  Barisal,
  Bhola,
  Jhalokati,
  Patuakhali,
  Pirojpur,
  Bandarban,
  Brahmanbaria,
  Chandpur,
  Chittagong,
  Comilla,
  Coxs_Bazar,
  Feni,
  Khagrachari,
  Lakshmipur,
  Noakhali,
  Rangamati,
  Habiganj,
  Maulvibazar,
  Sunamganj,
  Sylhet,
  Bagerhat,
  Chuadanga,
  Jessore,
  Jhenaidah,
  Khulna,
  Kushtia,
  Magura,
  Meherpur,
  Narail,
  Satkhira,
}

enum Gender {
  Male,
  Female,
  Other,
}

class NID {
  final String nidNumber;
  final String nidPin;
  final String name;
  //final String imageURL;
  final DateTime dateOfBirth;
  final Districts district;
  final Division division;
  final String address;
  final Gender gender;

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
  });
}
