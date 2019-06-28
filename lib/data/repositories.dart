import 'package:elt/ui/view-model.dart';

class ChapterRepo {
  static List<ChapterVM> _chapters = [
    ChapterVM(0,
        "Home",
        """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non eros a ex malesuada laoreet dignissim sed tellus. Nunc blandit feugiat mollis. Quisque dapibus leo sit amet ullamcorper ultricies. Pellentesque nisl sapien, tempus quis libero in, blandit aliquet erat. Suspendisse pellentesque mattis fermentum. Proin fermentum euismod ligula, nec congue libero sagittis sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris ac vehicula risus. Aliquam lobortis vulputate felis vitae dignissim. Nam ullamcorper turpis quis ipsum pellentesque convallis. Nullam cursus volutpat urna, a rhoncus est cursus eget. Quisque hendrerit orci eu accumsan iaculis. Fusce quam enim, malesuada eu libero sed, tempor imperdiet leo. Pellentesque et semper est. Nunc rhoncus magna ex, non malesuada metus lacinia ut.

xIn hac habitasse platea dictumst. Vestibulum semper congue ultricies. Pellentesque elementum facilisis suscipit. Ut efficitur, nibh vitae euismod fringilla, ipsum dolor sollicitudin leo, in sodales purus lectus egestas arcu. Vestibulum eget turpis porttitor, sodales diam non, tincidunt tortor. Vestibulum blandit consequat mattis. Ut maximus vulputate mi. Pellentesque mattis, justo a tristique fermentum, dui dolor mollis dui, non ultricies tortor risus et tortor. Nulla facilisi.
    """,
        ["Cane", "Gigi"],
        null,
        null,
        null,
        ["Cane"]),
    ChapterVM(1,
        "Taverna polena spezzata",
        "Andiamo nella taverna, troviamo un tizio che ci da una missione",
        ["Giovanni"],
        ["Palude di Ipswitch"],
        ["Porta la scatola"],
        ["Elfi"],
        ["Velociragno"],
        ["Scatola"])
  ];

  static List<ChapterVM> getChapters(int id)  {
    return _chapters;
  }

  static ChapterVM getChapter(int id) {
    return _chapters[id];
  }
}

class CampaignRepo {
  static int _progressive = 2;
  static final List<CampaignVM> _campaigns = [
    CampaignVM(0, "Eldritch Horrors", "Campagna basata su H. P. Lovecraft",
        "2019-05-15"),
    CampaignVM(
        1, "GuruGuru", "Un bel giorno il re del male Ghiri...", "2019-07-22"),
  ];

  static CampaignVM getCampaign(int id) {
    return _campaigns[id];
  }

  static List<CampaignVM> getCampaigns() {
    return _campaigns;
  }

  static int addCampaign(title, description, startDate) {
    _campaigns.add(CampaignVM(_progressive, "$title $_progressive", "$description $_progressive", startDate));
    _progressive++;
    return _progressive;
  }
}