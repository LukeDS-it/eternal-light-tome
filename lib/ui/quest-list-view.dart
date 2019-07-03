import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class QuestListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/quest';

  QuestListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _QuestListState(_campaignId);
  }
}

class _QuestListState extends State<QuestListView> {

  final CampaignVM _campaign;
  final List<QuestVM> _quests;

  _QuestListState._(this._campaign, this._quests);

  factory _QuestListState(int id) {
    return _QuestListState._(
        CampaignRepo.getCampaign(id), QuestRepo.getQuests(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (quests)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _quests.length,
          itemBuilder: (context, position) {
            var desc = _quests[position].description.length > 20
                ? _quests[position].description.substring(0, 20) + "..."
                : _quests[position].description;
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_quests[position].title),
              subtitle: Text(desc),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
