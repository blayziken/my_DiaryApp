import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showSpinner = false;
  String password;
  String email;
  String passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            height: 900,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.09), BlendMode.dstATop),
                image: AssetImage('images/girl3.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    padding: EdgeInsets.all(100.0),
                    child: Center(
                      child: Icon(
                        Icons.person_add,
                        color: Colors.orange[600],
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "EMAIL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[600],
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.orange[600],
                          width: 0.8,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'yourEmailAddress@email.com',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
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
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "PASSWORD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[600],
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.orange[600],
                          width: 0.8,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
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
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "CONFIRM PASSWORD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[600],
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.orange[600],
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 0.0, right: 10.0),
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
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            passwordConfirm = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: FlatButton(
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.orange[600],
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ))
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
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
                            padding: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "SIGN UP",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
