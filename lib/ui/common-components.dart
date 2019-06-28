import 'package:flutter/material.dart';

class CampaignDrawer extends Drawer {
  CampaignDrawer(String campaignName)
      : super(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(campaignName),
            ),
            ListTile(
              title: Text("Story"),
              leading: CommonIcons.STORY_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Characters"),
              leading: CommonIcons.CHARACTER_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Places"),
              leading: CommonIcons.PLACE_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Items"),
              leading: CommonIcons.ITEM_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Quests"),
              leading: CommonIcons.QUEST_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Monsters"),
              leading: CommonIcons.MONSTER_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Folks"),
              leading: CommonIcons.FOLK_ICON,
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Notes"),
              leading: CommonIcons.NOTE_ICON,
              onTap: () {
                print("hello");
              },
            ),
          ],
        ));
}

class CommonIcons {
  static const STORY_ICON = Icon(Icons.book);
  static const CHARACTER_ICON = Icon(Icons.person);
  static const PLACE_ICON = Icon(Icons.pin_drop);
  static const ITEM_ICON = Icon(Icons.vpn_key);
  static const QUEST_ICON = Icon(Icons.help);
  static const MONSTER_ICON = Icon(Icons.warning);
  static const FOLK_ICON = Icon(Icons.people);
  static const NOTE_ICON = Icon(Icons.speaker_notes);
}