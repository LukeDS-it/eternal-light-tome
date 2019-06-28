import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class StoryView extends StatefulWidget {
  final String _campaignName;

  StoryView(this._campaignName);

  @override
  State<StatefulWidget> createState() {
    return _StoryState(_campaignName);
  }
}

class _StoryState extends State<StoryView> {
  final String _campaignName;
  List<ChapterVM> chapters = [
    ChapterVM(
        "Home",
        """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non eros a ex malesuada laoreet dignissim sed tellus. Nunc blandit feugiat mollis. Quisque dapibus leo sit amet ullamcorper ultricies. Pellentesque nisl sapien, tempus quis libero in, blandit aliquet erat. Suspendisse pellentesque mattis fermentum. Proin fermentum euismod ligula, nec congue libero sagittis sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris ac vehicula risus. Aliquam lobortis vulputate felis vitae dignissim. Nam ullamcorper turpis quis ipsum pellentesque convallis. Nullam cursus volutpat urna, a rhoncus est cursus eget. Quisque hendrerit orci eu accumsan iaculis. Fusce quam enim, malesuada eu libero sed, tempor imperdiet leo. Pellentesque et semper est. Nunc rhoncus magna ex, non malesuada metus lacinia ut.

xIn hac habitasse platea dictumst. Vestibulum semper congue ultricies. Pellentesque elementum facilisis suscipit. Ut efficitur, nibh vitae euismod fringilla, ipsum dolor sollicitudin leo, in sodales purus lectus egestas arcu. Vestibulum eget turpis porttitor, sodales diam non, tincidunt tortor. Vestibulum blandit consequat mattis. Ut maximus vulputate mi. Pellentesque mattis, justo a tristique fermentum, dui dolor mollis dui, non ultricies tortor risus et tortor. Nulla facilisi.
    """,
        ["Cane"],
        null,
        null,
        null,
        ["Cane"]),
    ChapterVM(
        "Taverna polena spezzata",
        "Andiamo nella taverna, troviamo un tizio che ci da una missione",
        ["Giovanni"],
        ["Palude di Ipswitch"],
        ["Porta la scatola"],
        ["Elfi"],
        ["Velociragno"],
        ["Scatola"])
  ];

  _StoryState(this._campaignName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaignName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaignName),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          itemCount: chapters.length,
          itemBuilder: (context, position) {
            var chapter = chapters[position];
            var story = chapter.story.length > 300
                ? chapter.story.substring(0, 300) + "..."
                : chapter.story;
            return GestureDetector(
                onTap: () {
                  print("Open full chapter view");
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(chapter.place),
                        subtitle: Text(story),
                        isThreeLine: true,
                      ),
                      Wrap(
                        children: _getChips(chapter),
                      ),
                    ],
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  List<Widget> _getChips(ChapterVM chapter) {
    return <Widget>[
      if (chapter.people != null)
        Chip(
            label: Text(chapter.people.length.toString()),
            avatar: CommonIcons.CHARACTER_ICON),
      if (chapter.places != null)
        Chip(
            label: Text(chapter.places.length.toString()),
            avatar: CommonIcons.PLACE_ICON),
      if (chapter.quests != null)
        Chip(
            label: Text(chapter.quests.length.toString()),
            avatar: CommonIcons.QUEST_ICON),
      if (chapter.folks != null)
        Chip(
            label: Text(chapter.folks.length.toString()),
            avatar: CommonIcons.FOLK_ICON),
      if (chapter.monsters != null)
        Chip(
            label: Text(chapter.monsters.length.toString()),
            avatar: CommonIcons.MONSTER_ICON),
      if (chapter.items != null)
        Chip(
            label: Text(chapter.items.length.toString()),
            avatar: CommonIcons.ITEM_ICON),
    ];
  }
}
