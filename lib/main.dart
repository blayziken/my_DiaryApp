import 'package:flutter/material.dart';
import 'package:my_DiaryApp/provider/story.dart';
import 'package:my_DiaryApp/screens/welcome/welcomeScreen.dart';

import 'package:provider/provider.dart';
import './provider/story_provider.dart';
//Screens:
import 'screens/homeScreen.dart';
import './screens/StoryDetail.dart';
import './screens/auth_screen.dart';
import './screens/starred.dart';
import './provider/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Stories>(
          update: (context, auth, previousStories) => Stories(
            auth.token,
            auth.userId,
            previousStories == null ? [] : previousStories.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Story(),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'MyDiary',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: auth.isAuth ? HomeScreen() : AuthScreen(),
//          home: AddStory2(),
          routes: {
            StoryDetailScreen.routeName: (context) => StoryDetailScreen(),
            StarredStories.routeName: (context) => StarredStories(),
            HomeScreen.routeName: (context) => HomeScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
            WelcomeScreen.routeName: (context) => WelcomeScreen(),
          },
        ),
      ),
    );
  }
}

//auth.isAuth
//? HomeScreen()
//    : FutureBuilder(
//future: auth.tryAutoLogin(),
//builder: (context, authResultSnapshot) =>
//authResultSnapshot.connectionState ==
//ConnectionState.waiting
//? SplashScreen()
//    : AuthScreen(),
//),
