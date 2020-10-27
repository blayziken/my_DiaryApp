import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_DiaryApp/screens/homeScreen.dart';
import 'package:provider/provider.dart';
import '../tools/feelingsList.dart';
import '../provider/story_provider.dart';
import '../provider/story.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  String textFieldTitle;
  String textFieldStoryNote;
  String textFieldStoryNoteClipped;
  String selectedFeeling = '😁';

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String feeling in feelingsList) {
      var newItem = DropdownMenuItem(child: Text(feeling), value: feeling);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  //..
  TextEditingController controller;
  bool isNameValid = true;
  RegExp regExp = new RegExp(
    r'^[a-zA-Z]+$',
  );
  //..
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Container(
          margin: EdgeInsets.only(left: 300.0),
          child: FlatButton(
            child: Icon(
              Icons.check,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: () {
              print(textFieldTitle);
              //Checking if the TextFields are empty...
//              if (textFieldStoryNote == '') {
//                showDialog(
//                  context: context,
//                  builder: (context) => AlertDialog(
//                    title: Text('Oops 🙃'),
//                    content: Text(
//                      'You have an empty field ',
//                      style: TextStyle(fontStyle: FontStyle.italic),
//                    ),
//                    actions: <Widget>[
//                      FlatButton(
//                        child: Icon(Icons.arrow_back),
//                        onPressed: () {
//                          Navigator.pop(context);
//                        },
//                      ),
//                    ],
//                  ),
//                );
//              }
              //Adding Stories with Provider
//              var _editedStory = Story(
//                title: textFieldTitle,
//                storyNote: textFieldStoryNote,
//                storyNoteClipped: textFieldStoryNote,
//                id: null,
//                emoji: selectedFeeling,
//              );
//
//              Provider.of<Stories>(context, listen: false)
//                  .addStory(_editedStory);

//              showDialog(
//                context: context,
//                builder: (context) => AlertDialog(
//                  title: Text('Are you sure?'),
//                  actions: <Widget>[
//                    FlatButton(
//                      child: Text('?'),
//                      onPressed: () {
////                        Navigator.pop(context);
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => HomeScreen(),
//                          ),
//                        );
//                      },
//                    ),
//                  ],
//                ),
//              );
            },
          ),
        ),
      ),
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage('images/babe2.jpg'),
//              fit: BoxFit.contain),
//        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                margin: EdgeInsets.only(left: 150.0),
                child: Text(
                  'TITLE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10.0,
                  ),
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
//            color: Colors.grey,
                width: 400.0,
                child: TextField(
                  //..
//                  controller: _text,

                  //..
                  maxLength: 20,
                  decoration: InputDecoration(
//                    labelText: 'asds',
//                    errorText: _validate ? 'Value' : null,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  autofocus: false,
                  onChanged: (newText) {
                    if (regExp.hasMatch(newText)) {
                      isNameValid = true;
                    } else {
                      isNameValid = false;
                    }
                    setState(() {});
//                    textFieldTitle = newText;
//                    setState(() {
//                      _text.text.isEmpty ? _validate = true : _validate = false;
//                    });
                  },
                  controller: controller,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Your Story:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                width: 400.0,
                // hack textfield height
//            padding: EdgeInsets.only(bottom: 40.0),
                child: TextField(
                  maxLines: 23,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (value) {
                    textFieldStoryNote = value;
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
//                  margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'How you feeling? :',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.orange,
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              style: TextStyle(fontSize: 30.0),
                              dropdownColor: Colors.orange,
                              value: selectedFeeling,
                              items: getDropdownItems(),
                              onChanged: (value) {
                                setState(() {
                                  selectedFeeling = value;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//margin: EdgeInsets.only(left: 20.0),

//
