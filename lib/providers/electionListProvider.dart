import 'package:flutter/material.dart';
import '../models/candidateModel.dart';
import '../models/election_model.dart';

class ElectionList with ChangeNotifier {
  final List<Election> _electionList = [
    Election(
      id: '1234',
      title: 'Gazipur City Corporation Election ',
      candidateList: [
        Candidate(
          id: '123',
          name: 'Mirja Fakrul',
          party: 'BNP',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          party: 'Awami Leauge',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          party: 'Jamayet',
        ),
      ],
      validFor: 'Gazipur',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    Election(
      id: '1235',
      title: 'Bangladesh General Election',
      candidateList: [
        Candidate(
          id: '123',
          name: 'Mirja Fakrul',
          party: 'BNP',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          party: 'Awami Leauge',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          party: 'Jamayet',
        ),
      ],
      validFor: 'All',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    Election(
      id: '1236',
      title: 'Bangladesh General Election ',
      candidateList: [
        Candidate(
          id: '123',
          name: 'Mirja Fakrul',
          party: 'BNP',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          party: 'Awami Leauge',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          party: 'Jamayet',
        ),
      ],
      validFor: 'All',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    Election(
      id: '1237',
      title: 'Bangladesh General Election ',
      candidateList: [
        Candidate(
          id: '123',
          name: 'Mirja Fakrul',
          party: 'BNP',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          party: 'Awami Leauge',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          party: 'Jamayet',
        ),
      ],
      validFor: 'All',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
  ];

  List<Election> get electionList {
    return [..._electionList];
  }

  Election fetchElectionByID(String eID) {
    return _electionList.firstWhere((element) => element.id == eID);
  }
}
