import './candidateModel.dart';

class Election {
  final String id;
  final String title;
  final String validFor;
  final List<Candidate> candidateList;
  final DateTime startTime;
  final DateTime endTime;
  List<String> voterUserId = [];
  Election({
    required this.id,
    required this.title,
    required this.candidateList,
    required this.validFor,
    required this.startTime,
    required this.endTime,
  });

  void addVoterUserID(String userID) {
    voterUserId.add(userID);
  }
}
