import './candidateModel.dart';
import 'package:dio/dio.dart';
import '../constants/api_constant.dart';

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
    final url = '${addVoterUserIdapi}${id}.json';
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
                'symbolURL': e.symbol,
              })
          .toList(),
    });
    print(response.data);
  }

  bool canVote(String userID, String userArea) {
    final listA = validFor.where((element) => element == 'Bangladesh');
    if (listA.isEmpty) {
      final listB = validFor.where((element) => element == userArea);
      if (listB.isEmpty) {
        return false;
      }
    }
    final list = voterUserId.where((element) => element == userID);
    if (list.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
