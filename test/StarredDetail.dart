import 'package:flutter/material.dart';
import 'package:my_DiaryApp/provider/story_provider.dart';
import 'package:my_DiaryApp/screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../lib/provider/auth.dart';

class StarredDetailScreen extends StatefulWidget {
//  final String title;
//  final String storyNote;
//  final String storyNoteClipped;
//
//  StoryDetail({
//    this.title,
//    this.storyNote,
//    this.storyNoteClipped,
//  });

  static const routeName = '/starred-detail';

  @override
  _StarredDetailScreenState createState() => _StarredDetailScreenState();
}

class _StarredDetailScreenState extends State<StarredDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final storyId =
        ModalRoute.of(context).settings.arguments as String; //the id!
    final loadedStory = Provider.of<Stories>(
      context,
      listen: false,
    ).findById(storyId);
//    final story = Provider.of<Story>(context);
//    final providerStories = Provider.of<Stories>(context);

    final authData = Provider.of<Auth>(context, listen: false);

    var parsedDate = DateTime.parse(loadedStory.dateTime);
//    var parsedDate2 = DateFormat('d/M/yyyy').parse(loadedStory.dateTime);
    var parsedDateToDateFormat = DateFormat('dd/MM/yyyy').format(parsedDate);
//        dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()),

    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 229, 220, 10.0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40.0, left: 0.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back,
                      size: 35.0,
                      color: Colors.orange[600],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      loadedStory.isStarred
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 35.0,
                      color: Colors.orange[600],
                    ),
                    onPressed: () {
//                      story.toggleStarredStatus();
//                      loadedStory.isStarred = true;
//                      Navigator.pop(context);

                      setState(() {
                        loadedStory.toggleStarredStatus(
                          authData.token,
                          authData.userId,
                        );
                      });
                      Navigator.of(context)
                          .pushNamed(StarredDetailScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
//            Container(
//              height: 200.0,
//              child: Image.asset('images/backgroundcropped.jpg'),
//            ),
            Container(
              margin: EdgeInsets.only(top: 75.0, left: 40.0),
              child: Text(
                loadedStory.title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 60.0, left: 40.0, right: 30.0),
              child: Text(
                loadedStory.storyNote,
//                '$note + $key',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
//        color: Colors.black12,
        child: InkWell(
          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Spacer(),
//              Spacer(),
              Container(
//                margin: EdgeInsets.only(left: 140.0),
                child: Text(
                  'Created: $parsedDateToDateFormat',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Spacer(),
              Container(
//                  margin: EdgeInsets.only(left: 50.0),
                child: FlatButton(
                  child: Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.orange[600],
                  ),
                  onPressed: () {
//                    print(dateA);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do you want to remove this Story'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () async {
                              try {
                                await Provider.of<Stories>(context,
                                        listen: false)
                                    .deleteStory(storyId);
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              } catch (error) {
                                Navigator.pop(context);
                                print(error);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Error 😥'),
                                    content: Text('Deleting Failed!'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Icon(
                                          Icons.check,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
//                                           Navigator.of(context).pushNamed(
//                                            StarredDetailScreen.routeName,
//                                            arguments: storyId,
//                                          );
//
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//class ShapePainter extends CustomPainter {
//  @override
//  void paint(Canvas canvas, Size size) {
//    final left = 0.0;
//    final top = 220.0;
//    final right = 400.0;
//    final bottom = 900.0;
//    final rect = Rect.fromLTRB(left, top, right, bottom);
//    final paint = Paint()
//      ..color = Colors.black
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 4;
//    canvas.drawRect(rect, paint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return false;
//  }
//}
