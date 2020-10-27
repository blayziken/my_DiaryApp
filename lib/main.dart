import 'package:flutter/material.dart';
import 'package:my_DiaryApp/provider/story.dart';

import 'package:provider/provider.dart';
import './provider/story_provider.dart';
//Screens:
import 'screens/homeScreen.dart';
import './screens/StoryDetail.dart';
import './screens/AddStory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Stories(),
        ),
        ChangeNotifierProvider(
          create: (context) => Story(),
        )
      ],
      child: MaterialApp(
        title: 'MyDiary2',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          StoryDetailScreen.routeName: (context) => StoryDetailScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}
