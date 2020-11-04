import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StarredTile.dart';
import '../lib/provider/story_provider.dart';

class StarredList extends StatelessWidget {
  final bool showFavs;

  StarredList(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final storiesData = Provider.of<Stories>(context);
    final stories = showFavs ? storiesData.favoriteItems : storiesData.items;
    return ListView.builder(
      itemCount: stories.length,
//      reverse: true,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: stories[index],
//          create: (context) => stories[index],
          child: StarredTile(
//            id: stories[index].id,
//            title: stories[index].title,
//            storyNote: stories[index].storyNote,
//            storyNoteClipped: stories[index].storyNoteClipped,
              ),
        );
      },
    );
  }
}
