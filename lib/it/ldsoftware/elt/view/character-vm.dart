class CharacterVM {
  String name;
  String race;
  String notes;
  String alignment;
  String description;

  List<String> quests;
  List<String> appearances;
  List<String> affiliations;

  CharacterVM(this.name, this.description, this.race, this.alignment,
      this.notes, this.appearances, this.quests, this.affiliations);
}
