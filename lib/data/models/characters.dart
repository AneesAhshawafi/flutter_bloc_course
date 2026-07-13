class Character {
  late int id;
  late String name;
  late String gender;
  late String image;
  late String statusIfDeadOrAlive;
  late List<dynamic> episodesAppeareance;
  late List<dynamic> location;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    image = json['image'];
    statusIfDeadOrAlive = json['status'];
    episodesAppeareance = json['episode'];
    location = json['location'];
  }
}
