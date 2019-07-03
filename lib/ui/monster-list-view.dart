import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class MonsterListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/monster';

  MonsterListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _MonsterListState(_campaignId);
  }
}

class _MonsterListState extends State<MonsterListView> {

  final CampaignVM _campaign;
  final List<MonsterVM> _monsters;

  _MonsterListState._(this._campaign, this._monsters);

  factory _MonsterListState(int id) {
    return _MonsterListState._(
        CampaignRepo.getCampaign(id), MonsterRepo.getMonsters(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (monsters)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _monsters.length,
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_monsters[position].name),
              subtitle: Text(_monsters[position].type),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
