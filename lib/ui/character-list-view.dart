import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class CharacterListView extends StatefulWidget {
  static const ROUTE = '/character';

  final int _campaignId;

  CharacterListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _CharacterListState(_campaignId);
  }
}

class _CharacterListState extends State<CharacterListView> {
  final CampaignVM _campaign;
  final List<CharacterVM> _characters;

  _CharacterListState._(this._campaign, this._characters);

  factory _CharacterListState(int id) {
    return _CharacterListState._(
        CampaignRepo.getCampaign(id), CharacterRepo.getCharacters(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (characters)"),
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _characters.length,
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(_characters[position].name),
              subtitle: Text(_characters[position].race),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
