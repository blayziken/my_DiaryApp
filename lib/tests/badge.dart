import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
//  const Badge({
//    Key key,
//    @required this.child,
//    @required this.value,
//    this.color,
//  }) : super(key: key);
//
//  final Widget child;
//  final String value;
//  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 20.0,
          color: Colors.blue,
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
//              color: color != null ? color : Theme.of(context).accentColor,
              color: Colors.red,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              'Badgeeeee',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
