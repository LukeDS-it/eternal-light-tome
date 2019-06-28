import 'package:elt/data/repositories.dart';
import 'package:elt/ui/story-view.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

class CampaignsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CampaignsState();
  }
}

class _CampaignsState extends State<CampaignsView> {
  List<CampaignVM> _campaigns = CampaignRepo.getCampaigns();

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
          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ListTile(leading: Icon(Icons.memory), title: Text("Database")),
          ListTile(leading: Icon(Icons.info), title: Text("Credits"))
        ],
      )),
      body: ListView.builder(
          itemCount: _campaigns.length,
          itemBuilder: (context, position) {
            var campaign = _campaigns[position];
            return ListTile(
              title: Text(campaign.title),
              subtitle: Text(campaign.description),
              trailing: Text(campaign.startDate),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoryView(campaign.id)));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            CampaignRepo.addCampaign("Campagna", "Campagna", "2019-06-26");
            _campaigns = CampaignRepo.getCampaigns();
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
