import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class PlaceListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/place';

  PlaceListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _PlaceListState(_campaignId);
  }
}

class _PlaceListState extends State<PlaceListView> {

  final CampaignVM _campaign;
  final List<PlaceVM> _places;

  _PlaceListState._(this._campaign, this._places);

  factory _PlaceListState(int id) {
    return _PlaceListState._(
        CampaignRepo.getCampaign(id), PlaceRepo.getPlaces(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (places)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _places.length,
          itemBuilder: (context, position) {
            var desc = _places[position].description.length > 20
                ? _places[position].description.substring(0, 20) + "..."
                : _places[position].description;
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_places[position].name),
              subtitle: Text(desc),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
