import 'package:flutter/material.dart';
import '../models/candidateModel.dart';
import '../models/election_model.dart';

class ElectionList with ChangeNotifier {
  final List<Election> _electionList = [
    Election(
      id: '1235',
      title: 'Bangladesh General Election',
      candidateList: [
        Candidate(
          id: '123',
          name: 'Mirja Fakrul',
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '1234',
          name: 'Fayzur Rahman',
          party: 'BNP',
          area: 'Dhaka 02',
          candidateNID: '1234567892',
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
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
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
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
        ),
      ],
      validFor: 'All',
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
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
        ),
      ],
      validFor: 'All',
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
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
        ),
      ],
      validFor: 'All',
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
          candidateNID: '1234567899',
          party: 'BNP',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '124',
          name: 'obaidul Kader',
          candidateNID: '1234567898',
          party: 'Awami Leauge',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '125',
          name: 'Rubaya Seikh',
          candidateNID: '1234567897',
          party: 'Jamayet',
          area: 'Dhaka 01',
        ),
        Candidate(
          id: '1234',
          name: 'Fayzur Rahman',
          party: 'BNP',
          area: 'Dhaka 02',
          candidateNID: '1234567892',
        ),
      ],
      validFor: 'All',
      startTime: DateTime.parse('2023-08-07 10:00:00'),
      endTime: DateTime.parse('2023-08-07 16:38:00'),
    ),
  ];

  List<Election> get electionList {
    return [..._electionList];
  }

  Election fetchElectionByID(String eID) {
    return _electionList.firstWhere((element) => element.id == eID);
  }

  List<Election> liveElectionList() {
    final list = _electionList
        .where(
          (element) => ((element.startTime.compareTo(DateTime.now()) <= 0) &&
              element.endTime.compareTo(DateTime.now()) >= 0),
        )
        .toList();
    return list;
  }

  List<Election> finishedElectionList() {
    final list = _electionList
        .where((element) => element.endTime.compareTo(DateTime.now()) < 0)
        .toList();
    return list;
  }
}
