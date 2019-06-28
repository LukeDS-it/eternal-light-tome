import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class ChapterView extends StatefulWidget {
  static const ROUTE = '/chapter';

  final int _chapterId;

  ChapterView(BuildContext context)
      : _chapterId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _ChapterState(_chapterId);
  }
}

class _ChapterState extends State<ChapterView> {
  ChapterVM _chapter;
  List<Widget> _pages;

  int _selected = 0;

  _ChapterState._(this._chapter, this._pages);

  factory _ChapterState(int id) {
    var chapter = ChapterRepo.getChapter(id);
    var pages = [
      Text(chapter.story),
      _listView(chapter.people),
      _listView(chapter.places),
      _listView(chapter.quests),
      _listView(chapter.monsters),
      _listView(chapter.items),
      _listView(chapter.folks)
    ];
    return _ChapterState._(chapter, pages);
  }

  static Widget _listView(List<String> list) {
    if (list == null) {
      return ListView(children: <Widget>[ListTile(title: Text("No items"))]);
    } else {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) {
            return ListTile(title: Text(list[position]));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_chapter.place),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: _pages.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selected,
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: CommonIcons.STORY_ICON, title: Text("Story")),
            BottomNavigationBarItem(
                icon: CommonIcons.CHARACTER_ICON, title: Text("Characters")),
            BottomNavigationBarItem(
                icon: CommonIcons.PLACE_ICON, title: Text("Places")),
            BottomNavigationBarItem(
                icon: CommonIcons.QUEST_ICON, title: Text("Quests")),
            BottomNavigationBarItem(
                icon: CommonIcons.MONSTER_ICON, title: Text("Monsters")),
            BottomNavigationBarItem(
                icon: CommonIcons.ITEM_ICON, title: Text("Items")),
            BottomNavigationBarItem(
                icon: CommonIcons.FOLK_ICON, title: Text("Folks")),
          ]),
    );
  }
}
