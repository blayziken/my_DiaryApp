import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage('images/babe.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(120.0),
//                child: Center(
//                  child: Icon(
//                    Icons.person,
//                    color: Colors.orange[600],
//                    size: 50.0,
//                  ),
//                ),
//              ),
//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.only(left: 40.0),
//                      child: Text(
//                        "EMAIL",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          color: Colors.orange[600],
//                          fontSize: 15.0,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Container(
//                margin:
//                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//                alignment: Alignment.center,
//                decoration: BoxDecoration(
//                  border: Border(
//                    bottom: BorderSide(
//                        color: Colors.orange[600],
//                        width: 0.5,
//                        style: BorderStyle.solid),
//                  ),
//                ),
//                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        keyboardType: TextInputType.emailAddress,
//                        style: TextStyle(color: Colors.white),
//                        textAlign: TextAlign.left,
//                        decoration: InputDecoration(
//                          border: InputBorder.none,
//                          hintText: 'yourEmailAddress@email.com',
//                          hintStyle: TextStyle(color: Colors.grey),
//                        ),
//                        onChanged: (value) {
//                          email = value;
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Divider(
//                height: 24.0,
//              ),
//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.only(left: 40.0),
//                      child: Text(
//                        "PASSWORD",
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          color: Colors.orange[600],
//                          fontSize: 15.0,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Container(
//                margin:
//                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//                alignment: Alignment.center,
//                decoration: BoxDecoration(
//                  border: Border(
//                    bottom: BorderSide(
//                        color: Colors.orange[600],
//                        width: 0.5,
//                        style: BorderStyle.solid),
//                  ),
//                ),
//                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Expanded(
//                      child: TextField(
//                        style: TextStyle(color: Colors.white),
//                        obscureText: true,
//                        textAlign: TextAlign.left,
//                        decoration: InputDecoration(
//                          border: InputBorder.none,
//                          hintText: '*********',
//                          hintStyle: TextStyle(color: Colors.grey),
//                        ),
//                        onChanged: (value) {
//                          password = value;
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Divider(
//                height: 24.0,
//              ),
//              Container(
//                margin:
//                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
//                alignment: Alignment.center,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: FlatButton(
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
//                        color: Colors.orange[600],
//                        child: Container(
//                          padding: const EdgeInsets.symmetric(
//                            vertical: 20.0,
//                            horizontal: 20.0,
//                          ),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Expanded(
//                                child: Text(
//                                  "LOGIN",
//                                  textAlign: TextAlign.center,
//                                  style: TextStyle(
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                        onPressed: () async {},
//                      ),
//                    ),
//                  ],
//                ),
//              ),

              ///

              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "EMAIL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
//                              hintText: 'yourEmailAddress@email.com',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
//                              hintText: '*********',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.orange[600],
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "LOGIN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {},
                      ),
                    ),
                  ],
                ),
              ),

              ///
            ],
          ),
        ),
      ),
    );
  }
}
