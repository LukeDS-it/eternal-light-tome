import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class ItemListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/item';

  ItemListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _ItemListState(_campaignId);
  }
}

class _ItemListState extends State<ItemListView> {

  final CampaignVM _campaign;
  final List<ItemVM> _items;

  _ItemListState._(this._campaign, this._items);

  factory _ItemListState(int id) {
    return _ItemListState._(
        CampaignRepo.getCampaign(id), ItemRepo.getItems(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (items)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, position) {
            var desc = _items[position].description.length > 20
                ? _items[position].description.substring(0, 20) + "..."
                : _items[position].description;
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_items[position].name),
              subtitle: Text(desc),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
