import 'package:oes/constants/constants.dart';

import './candidateModel.dart';
import 'package:dio/dio.dart';

class Election {
  final String id;
  final String title;
  final List<String> validFor;
  final List<Candidate> candidateList;
  final DateTime startTime;
  final DateTime endTime;
  List<String> voterUserId = [];
  Election(
      {required this.id,
      required this.title,
      required this.candidateList,
      required this.validFor,
      required this.startTime,
      required this.endTime,
      required this.voterUserId});

  Future<void> addVoterUserID(String userID) async {
    final Dio _dio = Dio();
    final url =
        'https://online-election-system-fb9f4-default-rtdb.asia-southeast1.firebasedatabase.app/elections/${id}.json';
    _dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    voterUserId.add(userID);
    final response = await _dio.patch(url, data: {
      'voters': voterUserId,
      'candidate': candidateList
          .map((e) => {
                'candidateNID': e.candidateNID,
                'candidateArea': e.area,
                'candidateParty': e.party,
                'candidateVoteCount': e.voteCount,
              })
          .toList(),
    });
    print(response.statusMessage);
  }

  bool canVote(String userID, String userArea) {
    bool canVote = true;
    final listA = validFor.where((element) => element == 'Bangladesh');
    if (listA.isEmpty) {
      final listB = validFor.where((element) => element == userArea);
      if (listB.isEmpty) canVote = false;
    }
    final list = voterUserId.where((element) => element == userID);
    if (list.isEmpty) canVote = canVote & true;
    return canVote;
  }
}
