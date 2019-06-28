import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'chapter-view.dart';
import 'common-components.dart';

class StoryView extends StatefulWidget {
  final int _campaignId;

  StoryView(this._campaignId);

  @override
  State<StatefulWidget> createState() {
    return _StoryState(_campaignId);
  }
}

class _StoryState extends State<StoryView> {
  final int _campaignId;
  final CampaignVM _campaign;
  final List<ChapterVM> _chapters;

  _StoryState._(this._campaignId, this._campaign, this._chapters);

  factory _StoryState(int id) {
    CampaignVM campaign = CampaignRepo.getCampaign(id);
    List<ChapterVM> chapters = ChapterRepo.getChapters(id);

    return _StoryState._(id, campaign, chapters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          itemCount: _chapters.length,
          itemBuilder: (context, position) {
            var chapter = _chapters[position];
            var story = chapter.story.length > 300
                ? chapter.story.substring(0, 300) + "..."
                : chapter.story;
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterView(chapter.id)));
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
                        spacing: 8,
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
