class QuestVM {
  String title;
  String notes;
  String description;

  String startChar;
  String endChar;

  String startPlace;
  String endPlace;

  List<String> people;

  QuestVM(this.description, this.notes, this.title, this.startChar, this.endChar,
      this.startPlace, this.endPlace, this.people);
}
