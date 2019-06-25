import 'link.dart';

class PlaceVM {
  String name;
  String description;

  List<String> subPlaces;

  List<Link> quests;
  List<Link> monsters;
  List<Link> characters;

  PlaceVM(this.name, this.description, this.subPlaces, this.quests,
      this.monsters, this.characters);
}
