import 'package:flutter/material.dart';

import './nid_model.dart';

class eNumConvert {
  String districtConversion(Districts value) {
    switch (value) {
      case Districts.Dhaka:
        return "Dhaka";
      case Districts.Faridpur:
        return "";
      case Districts.Gazipur:
        return "";
      case Districts.Gopalganj:
        return "";
      case Districts.Jamalpur:
        return "";
      case Districts.Kishoreganj:
        return "";
      case Districts.Madaripur:
        return "";
      case Districts.Manikganj:
        return "";
      case Districts.Munshiganj:
        return "";
      case Districts.Mymensingh:
        return "";
      case Districts.Narayanganj:
        return "";
      case Districts.Narsingdi:
        return "";
      case Districts.Netrokona:
        return "";
      case Districts.Rajbari:
        return "";
      case Districts.Shariatpur:
        return "";
      case Districts.Sherpur:
        return "";
      case Districts.Tangail:
        return "";
      case Districts.Bogra:
        return "";
      case Districts.Joypurhat:
        return "";
      case Districts.Naogaon:
        return "";
      case Districts.Natore:
        return "";
      case Districts.Nawabganj:
        return "";
      case Districts.Pabna:
        return "";
      case Districts.Rajshahi:
        return "";
      case Districts.Sirajgonj:
        return "";
      case Districts.Dinajpur:
        return "";
      case Districts.Gaibandha:
        return "";
      case Districts.Kurigram:
        return "";
      case Districts.Lalmonirhat:
        return "";
      case Districts.Nilphamari:
        return "";
      case Districts.Panchagarh:
        return "";
      case Districts.Rangpur:
        return "";
      case Districts.Thakurgaon:
        return "";
      case Districts.Barguna:
        return "";
      case Districts.Barisal:
        return "";
      case Districts.Bhola:
        return "";
      case Districts.Jhalokati:
        return "";
      case Districts.Patuakhali:
        return "";
      case Districts.Pirojpur:
        return "";
      case Districts.Bandarban:
        return "";
      case Districts.Brahmanbaria:
        return "";
      case Districts.Chandpur:
        return "";
      case Districts.Chittagong:
        return "";
      case Districts.Comilla:
        return "";
      case Districts.Coxs_Bazar:
        return "";
      case Districts.Feni:
        return "";
      case Districts.Khagrachari:
        return "";
      case Districts.Lakshmipur:
        return "";
      case Districts.Noakhali:
        return "";
      case Districts.Rangamati:
        return "";
      case Districts.Habiganj:
        return "";
      case Districts.Maulvibazar:
        return "";
      case Districts.Sunamganj:
        return "";
      case Districts.Sylhet:
        return "";
      case Districts.Bagerhat:
        return "";
      case Districts.Chuadanga:
        return "";
      case Districts.Jessore:
        return "";
      case Districts.Jhenaidah:
        return "";
      case Districts.Khulna:
        return "";
      case Districts.Kushtia:
        return "";
      case Districts.Magura:
        return "";
      case Districts.Meherpur:
        return "";
      case Districts.Narail:
        return "";
      case Districts.Satkhira:
        return "";
      default:
        return "No District";
    }
  }

  String genderConversion(Gender value) {
    switch (value) {
      case Gender.Male:
        return "Male";
      case Gender.Female:
        return "Female";
      case Gender.Other:
        return "Other";
      default:
        return "No Gender";
    }
  }

  String divisionConversion(Division value) {
    switch (value) {
      case Division.Barishal:
        return "Barishal";
      case Division.Chittagong:
        return "Chittagong";
      case Division.Dhaka:
        return "Dhaka";
      case Division.Khulna:
        return "Khulna";
      case Division.Mymensingh:
        return "Mymensingh";
      case Division.Rajshahi:
        return "Rajshahi";
      case Division.Rangpur:
        return "Rangpur";
      case Division.Sylhet:
        return "Sylhet";
      default:
        return "No Division";
    }
  }
}
