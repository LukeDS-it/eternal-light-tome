import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class FolkListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/folk';

  FolkListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _FolkListState(_campaignId);
  }
}

class _FolkListState extends State<FolkListView> {

  final CampaignVM _campaign;
  final List<FolkVM> _folks;

  _FolkListState._(this._campaign, this._folks);

  factory _FolkListState(int id) {
    return _FolkListState._(
        CampaignRepo.getCampaign(id), FolkRepo.getFolks(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (folks)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _folks.length,
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_folks[position].name),
              subtitle: Text(_folks[position].race),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
