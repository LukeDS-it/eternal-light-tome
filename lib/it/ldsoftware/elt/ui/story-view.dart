import 'package:elt/it/ldsoftware/elt/ui/view-model.dart';
import 'package:flutter/material.dart';

import 'common-components.dart';

class StoryView extends StatefulWidget {
  final String _campaignName;

  StoryView(this._campaignName);

  @override
  State<StatefulWidget> createState() {
    return _StoryState(_campaignName);
  }
}

class _StoryState extends State<StoryView> {
  final String _campaignName;
  List<ChapterVM> chapters = [
    ChapterVM("Home", """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non eros a ex malesuada laoreet dignissim sed tellus. Nunc blandit feugiat mollis. Quisque dapibus leo sit amet ullamcorper ultricies. Pellentesque nisl sapien, tempus quis libero in, blandit aliquet erat. Suspendisse pellentesque mattis fermentum. Proin fermentum euismod ligula, nec congue libero sagittis sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris ac vehicula risus. Aliquam lobortis vulputate felis vitae dignissim. Nam ullamcorper turpis quis ipsum pellentesque convallis. Nullam cursus volutpat urna, a rhoncus est cursus eget. Quisque hendrerit orci eu accumsan iaculis. Fusce quam enim, malesuada eu libero sed, tempor imperdiet leo. Pellentesque et semper est. Nunc rhoncus magna ex, non malesuada metus lacinia ut.

xIn hac habitasse platea dictumst. Vestibulum semper congue ultricies. Pellentesque elementum facilisis suscipit. Ut efficitur, nibh vitae euismod fringilla, ipsum dolor sollicitudin leo, in sodales purus lectus egestas arcu. Vestibulum eget turpis porttitor, sodales diam non, tincidunt tortor. Vestibulum blandit consequat mattis. Ut maximus vulputate mi. Pellentesque mattis, justo a tristique fermentum, dui dolor mollis dui, non ultricies tortor risus et tortor. Nulla facilisi.
    """)
  ];

  _StoryState(this._campaignName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_campaignName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: CampaignDrawer(_campaignName),
      body: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: chapters.length,
          itemBuilder: (context, position) {
            var chapter = chapters[position];
            return GestureDetector(
              onTap: () {
                print("Open full chapter view");
              },
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(chapter.place),
                      subtitle: Text(chapter.story.substring(0, 300) + "..."),
                      isThreeLine: true,
                    ),
                    Row(

                    ),
                  ],
                ),
              )
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
