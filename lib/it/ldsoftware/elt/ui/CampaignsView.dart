import 'package:elt/it/ldsoftware/elt/view/campaign-vm.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            children: <Widget>[

            ],
          )
      ),
      body: ListView.builder(
          itemCount: campaigns.length,
          itemBuilder: (context, position) {
            var campaign = campaigns[position];
            return Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.cloud_circle,
                      size: 55.0,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  campaign.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      fontSize: 17.0),
                                ),
                                Text(
                                  campaign.startDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      fontSize: 13.5),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      campaign.description,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                          fontSize: 15.5),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
            ]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
