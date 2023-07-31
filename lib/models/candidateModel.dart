class Candidate {
  String id;
  String party;
  String name;
  String area;
  int voteCount = 0;
  Candidate({
    required this.id,
    required this.name,
    required this.party,
    required this.area,
  });

  void addVote() {
    voteCount++;
  }
}
