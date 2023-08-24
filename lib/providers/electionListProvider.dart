import 'dart:convert';
import '../constants/api_constant.dart';
import 'package:flutter/material.dart';
import '../models/candidateModel.dart';
import '../models/election_model.dart';
import 'package:http/http.dart' as http;

class ElectionList with ChangeNotifier {
  List<Election> _electionList = [];

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

  List<Election> upcomingElectionList() {
    final list = _electionList
        .where((element) => element.startTime.compareTo(DateTime.now()) > 0)
        .toList();
    return list;
  }

  Future<void> addElection(Election election) async {
    final url = Uri.https(election_api, '/elections.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': election.title,
            'starttime': election.startTime.toIso8601String(),
            'endtime': election.endTime.toIso8601String(),
            'validAreas': election.validFor,
            'voters': election.voterUserId,
            'candidate': election.candidateList
                .map((e) => {
                      'candidateNID': e.candidateNID,
                      'candidateArea': e.area,
                      'candidateParty': e.party,
                      'candidateVoteCount': e.voteCount,
                      'symbolURL': e.symbol
                    })
                .toList(),
          },
        ),
      );
      final responsedata = json.decode(response.body);
      print(responsedata['name']);
      Election elct = Election(
        id: responsedata['name'],
        title: election.title,
        candidateList: election.candidateList,
        validFor: election.validFor,
        startTime: election.startTime,
        endTime: election.endTime,
        voterUserId: election.voterUserId,
      );
      _electionList.insert(0, elct);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchElections() async {
    final url = Uri.https(election_api, '/elections.json');
    try {
      final response = await http.get(url);
      if (json.decode(response.body) == null) return;
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Election> extractedList = [];
      extractedData.forEach(
        (key, value) {
          extractedList.add(
            Election(
              id: key,
              title: value['title'],
              candidateList: (value['candidate'] as List<dynamic>)
                  .map(
                    (e) => Candidate(
                      party: e['candidateParty'],
                      area: e['candidateArea'],
                      candidateNID: e['candidateNID'],
                      voteCount: e['candidateVoteCount'],
                      symbol: e['symbolURL'],
                    ),
                  )
                  .toList(),
              validFor: (value['validAreas'].cast<String>()),
              startTime: DateTime.parse(value['starttime']),
              endTime: DateTime.parse(value['endtime']),
              voterUserId: value['voters'].cast<String>(),
            ),
          );
        },
      );
      _electionList = List.from(extractedList.reversed);
      //print(extractedData);
    } catch (error) {
      rethrow;
    }
  }
}
