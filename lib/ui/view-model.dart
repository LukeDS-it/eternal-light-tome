class CampaignVM {
  int id;

  String title;
  String description;
  String startDate;

  CampaignVM(this.id, this.title, this.description, this.startDate);
}

class ChapterVM {
  int id;

  String place;
  String story;

  List<String> folks;
  List<String> items;
  List<String> people;
  List<String> places;
  List<String> quests;
  List<String> monsters;

  ChapterVM(this.id, this.place, this.story,
      [this.people,
        this.places,
        this.quests,
        this.folks,
        this.monsters,
        this.items]);
}

class CharacterVM {
  int id;

  String name;
  String race;
  String notes;
  String alignment;
  String description;

  List<String> quests;
  List<String> appearances;
  List<String> affiliations;

  CharacterVM(this.id, this.name, this.description, this.race, this.alignment,
      this.notes,
      [this.appearances, this.quests, this.affiliations]);
}

class FolkVM {
  int id;

  String name;
  String race;
  String place;

  List<String> people;
  List<String> places;

  FolkVM(this.id, this.name, this.race, this.place, [this.people, this.places]);
}

class ItemVM {
  int id;
  int value;

  String name;
  String effect;
  String description;

  List<String> appearances;

  ItemVM(this.id, this.value, this.name, this.effect, this.description,
      [this.appearances]);
}

class Link {
  String name;
  String chapter;

  Link(this.name, this.chapter);
}

class MonsterVM {
  int id;
  int health;

  String name;
  String type;

  List<String> places;

  MonsterVM(this.id, this.health, this.name, this.type, [this.places]);
}

class PlaceVM {
  int id;

  String name;
  String description;

  List<String> subPlaces;

  List<Link> quests;
  List<Link> monsters;
  List<Link> characters;

  PlaceVM(this.id, this.name, this.description,
      [this.subPlaces, this.quests, this.monsters, this.characters]);
}

class QuestVM {
  int id;

  String title;
  String notes;
  String description;

  String startChar;
  String endChar;

  String startPlace;
  String endPlace;

  List<String> people;

  QuestVM(this.id, this.description, this.notes, this.title, this.startChar,
      this.endChar, this.startPlace, this.endPlace,
      [this.people]);
}

class NoteVM {
  int id;

  String title;
  String text;

  NoteVM(this.id, this.title, this.text);
}
