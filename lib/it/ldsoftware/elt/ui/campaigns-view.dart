import 'package:elt/it/ldsoftware/elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'list-element.dart';

class CampaignsView extends StatelessWidget {
  final List<CampaignVM> campaigns = [
    CampaignVM(
        "Eldritch Horrors", "Campagna basata su H. P. Lovecraft", "2019-05-15"),
    CampaignVM(
        "GuruGuru", "Un bel giorno il re del male Ghiri...", "2019-07-22"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Active Campaigns"),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Drawer header"),
              ),
              ListTile(
                leading: Icon(Icons.archive),
                title: Text("Archived campaigns"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings")
              ),
              ListTile(
                leading: Icon(Icons.memory),
                title: Text("Database")
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Credits")
              )
            ],
          )
      ),
      body: ListView.builder(
          itemCount: campaigns.length,
          itemBuilder: (context, position) {
            var campaign = campaigns[position];
            return ListElement(
                campaign.title, campaign.description, campaign.startDate);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}