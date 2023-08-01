class Candidate {
  String id;
  String party;
  String name;
  String area;
  int voteCount = 0;
  String candidateNID;
  Candidate({
    required this.id,
    required this.name,
    required this.party,
    required this.area,
    required this.candidateNID,
  });

  void addVote() {
    voteCount++;
  }
}
