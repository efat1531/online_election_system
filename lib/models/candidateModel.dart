class Candidate {
  String id;
  String party;
  String name;
  int voteCount = 0;
  Candidate({
    required this.id,
    required this.name,
    required this.party,
  });

  void addVote() {
    voteCount++;
  }
}
