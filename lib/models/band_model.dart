class BandModel {
  String id;
  String name;
  int votes;

  BandModel({required this.id, required this.name, this.votes = 0});

  factory BandModel.fromMap(Map<String, dynamic> obj) =>
      BandModel(id: obj['id'], name: obj['name'], votes: obj['votes']);
}
