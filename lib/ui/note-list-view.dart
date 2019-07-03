import 'package:elt/data/repositories.dart';
import 'package:elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class NoteListView extends StatefulWidget {
  final int _campaignId;
  static const ROUTE = '/note';

  NoteListView(BuildContext context)
      : _campaignId = ModalRoute.of(context).settings.arguments;

  @override
  State<StatefulWidget> createState() {
    return _NoteListState(_campaignId);
  }
}

class _NoteListState extends State<NoteListView> {

  final CampaignVM _campaign;
  final List<NoteVM> _notes;

  _NoteListState._(this._campaign, this._notes);

  factory _NoteListState(int id) {
    return _NoteListState._(
        CampaignRepo.getCampaign(id), NoteRepo.getNotes(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaign.title + " (notes)"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaign, context),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, position) {
            var desc = _notes[position].text.length > 20
                ? _notes[position].text.substring(0, 20) + "..."
                : _notes[position].text;
            return ListTile(
              leading: Icon(Icons.place),
              title: Text(_notes[position].title),
              subtitle: Text(desc),
            );
          }),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
