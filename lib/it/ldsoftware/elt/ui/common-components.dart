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
              leading: Icon(Icons.book),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Characters"),
              leading: Icon(Icons.contact_mail),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Places"),
              leading: Icon(Icons.pin_drop),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Items"),
              leading: Icon(Icons.move_to_inbox),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Quests"),
              leading: Icon(Icons.help),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Monsters"),
              leading: Icon(Icons.warning),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Folks"),
              leading: Icon(Icons.people),
              onTap: () {
                print("hello");
              },
            ),
            ListTile(
              title: Text("Notes"),
              leading: Icon(Icons.speaker_notes),
              onTap: () {
                print("hello");
              },
            ),
          ],
        ));
}
