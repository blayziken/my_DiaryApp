import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:my_DiaryApp/screens/auth_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
//  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 100.0,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
//      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange[800],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.07), BlendMode.dstATop),
            image: AssetImage('images/ba69dcabeb997dd49ec8b5577c152e9c.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FlatButton(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// TODO ICON LOGO
                Hero(
                  tag: 'logo',
                  child: Container(
//                margin: EdgeInsets.only(top: 150.0),
                    child: Image.asset('images/logo.png'),
                    height: controller.value,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: TypewriterAnimatedTextKit(
                      text: ['Write your stories..', 'Go infinity and beyond!'],
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Agne'),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart),
                ),
              ],
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AuthScreen.routeName);
          },
        ),
      ),
    );
  }
}

//Container(
//margin: EdgeInsets.only(top: 50.0),
//child: FlatButton(
//child: Icon(
//Icons.navigate_next,
//size: 30.0,
//color: Colors.white,
//),
//),
//),
