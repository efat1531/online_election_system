class Candidate {
  String id;
  String party;
  String area;
  int voteCount = 0;
  String candidateNID;
  Candidate({
    required this.id,
    required this.party,
    required this.area,
    required this.candidateNID,
  });

  void addVote() {
    voteCount++;
  }
}
