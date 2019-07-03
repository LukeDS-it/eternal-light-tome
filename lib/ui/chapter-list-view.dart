import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'chapter-view.dart';
import 'common-components.dart';

class ChapterListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/story';

  ChapterListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _ChapterListState(_campaignId);
  }
}

class _ChapterListState extends State<ChapterListView> {
  final CampaignVM _campaign;
  final List<ChapterVM> _chapters;

  _ChapterListState._(this._campaign, this._chapters);

  factory _ChapterListState(int id) {
    return _ChapterListState._(
        CampaignRepo.getCampaign(id), ChapterRepo.getChapters(id));
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
      drawer: CampaignDrawer(_campaign, context),
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
                  Navigator.pushNamed(context, ChapterView.ROUTE,
                      arguments: chapter.id);
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
