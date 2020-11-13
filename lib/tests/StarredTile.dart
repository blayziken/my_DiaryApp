import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../lib/screens/StarredDetail.dart';
import 'StarredDetail.dart';
import 'package:provider/provider.dart';
import '../provider/story.dart';
import '../provider/story_provider.dart';

class StarredTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final story = Provider.of<Story>(context);
    int clipOrNot = story.storyNote.length;
    String storyNoteClipped1;

    if (clipOrNot < 20) {
      storyNoteClipped1 = story.storyNote;
    } else {
      storyNoteClipped1 = story.storyNote.substring(0, 20) + '....';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            StarredDetailScreen.routeName,
            arguments: story.id,
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                radius: 9.0,
//                backgroundColor: color,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Container(
              width: 280.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    story.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
//                      letterSpacing: 3.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    storyNoteClipped1,
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
//              margin: EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
              child: Text(
                story.emoji,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//For Dismissible
//key: ValueKey(story.id),
//background: Container(
////          height: 200.0,
//color: Colors.red,
//child: Icon(
//Icons.delete,
//color: Colors.white,
//size: 30.0,
//),
//alignment: Alignment.centerRight,
//padding: EdgeInsets.only(right: 20),
//),
//direction: DismissDirection.endToStart,
//onDismissed: (direction) {
//stories.removeItem(story.id);
//},
