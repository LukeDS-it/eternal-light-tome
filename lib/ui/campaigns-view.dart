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
  final List<CampaignVM> _campaigns = [
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
                        builder: (context) => StoryView(campaign.title)));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _campaigns.add(CampaignVM("Campagna1", "Campagna2", "2019-06-26"));
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
