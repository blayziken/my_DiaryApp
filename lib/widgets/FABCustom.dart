import 'package:flutter/material.dart';
import 'package:my_DiaryApp/screens/starred.dart';
import '../tests/badge.dart';
import '../screens/AddStory.dart';

class CustomFAB extends StatefulWidget {
  @override
  _CustomFABState createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOne, degTwo, degThree;
  Animation rotationAnimation;

  double getRadians(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOne = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);

    degTwo = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);

    degThree = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);

    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
//                      color: Colors.black.withOpacity(0.5), // comment or change to transparent color
                    height: 150.0,
                    width: 150.0,
                  ),
                ),

                /// NORMAL FLOATING ACTION BUTTON ISH
                Transform(
                  transform:
                      Matrix4.rotationZ(getRadians(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: Colors.red,
                    height: 60,
                    width: 60,
                    icon: Icon(
                      Icons.all_inclusive,
                      color: Colors.white,
                      size: 35,
                    ),
                    onClick: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                ),

                /// ADD STORY FAB
                /// DEG ONE
                Transform.translate(
                  offset:
                      Offset.fromDirection(getRadians(270), degOne.value * 100),
                  child: Transform(
                    transform:
                        Matrix4.rotationZ(getRadians(rotationAnimation.value))
                          ..scale(degOne.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                      color: Colors.orange[600],
                      height: 50,
                      width: 50,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddStory(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// STARRED MESSAGES FAB
                /// DEG TWO
                Transform.translate(
                  offset:
                      Offset.fromDirection(getRadians(225), degTwo.value * 100),
                  child: Transform(
                    transform:
                        Matrix4.rotationZ(getRadians(rotationAnimation.value))
                          ..scale(degTwo.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35,
                      ),
                      color: Colors.indigoAccent,
                      height: 50,
                      width: 50,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StarredStories(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// SIGN OUT FAB
                /// DEG THREE
                Transform.translate(
                  offset: Offset.fromDirection(
                      getRadians(180), degThree.value * 100),
                  child: Transform(
                    transform:
                        Matrix4.rotationZ(getRadians(rotationAnimation.value))
                          ..scale(degThree.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      icon: Icon(
                        Icons.directions_walk,
                        color: Colors.white,
                        size: 35,
                      ),
                      color: Colors.brown,
                      height: 50,
                      width: 50,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Badge(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.height, this.icon, this.onClick, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        onPressed: onClick,
        enableFeedback: true,
      ),
    );
  }
}
