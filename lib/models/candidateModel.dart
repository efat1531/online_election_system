

class Candidate {
  String party;
  String area;
  int voteCount = 0;
  String candidateNID;
  Candidate({
    required this.party,
    required this.area,
    required this.candidateNID,
    required this.voteCount,
  });

  void addVote() {

    voteCount++;
  }
}
