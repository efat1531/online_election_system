class Candidate {
  String id;
  String party;
  String name;
  int voteCount = 1;
  Candidate({
    required this.id,
    required this.name,
    required this.party,
  });

  void addVote() {
    voteCount++;
  }
}
