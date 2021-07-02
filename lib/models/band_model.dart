class BandModel {
  String id;
  String name;
  int votes;

  BandModel({required this.id, required this.name, this.votes = 0});

  factory BandModel.fromMap(Map<String, dynamic> obj) => BandModel(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name',
        votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes',
      );
}
