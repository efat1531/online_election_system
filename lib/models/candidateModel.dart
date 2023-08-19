class Candidate {
  String party;
  String area;
  int voteCount = 0;
  String candidateNID;
  String symbol;
  Candidate({
    required this.party,
    required this.area,
    required this.candidateNID,
    required this.voteCount,
    required this.symbol,
  });

  void addVote() {
    voteCount++;
  }
}
