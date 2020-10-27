import 'package:flutter/material.dart';
import '../tools/feelingsList.dart';
import 'package:provider/provider.dart';
import 'package:my_DiaryApp/screens/homeScreen.dart';
import '../provider/story_provider.dart';
import '../provider/story.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  final _focusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String textFieldTitle;
  String textFieldStoryNote;
  String selectedFeeling = '😁';

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String feeling in feelingsList) {
      var newItem = DropdownMenuItem(child: Text(feeling), value: feeling);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  var _isLoading = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
              onPressed: () async {
                final isValid = _form.currentState.validate();
                if (!isValid) {
                  return;
                }

                setState(() {
                  _isLoading = true;
                });
                //Adding Stories with Provider..
                var _newStory = Story(
                  title: textFieldTitle,
                  storyNote: textFieldStoryNote,
                  id: null,
                  emoji: selectedFeeling,
                );
                try {
                  await Provider.of<Stories>(context, listen: false)
                      .addStory(_newStory);
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                } catch (error) {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('An error occured!'),
                      content: Text('Something went wrong.'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Okay'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        )
                      ],
                    ),
                  );
                }

//                Navigator.of(context).pop();

                //
//.. SHOW DIALOG
//              showDialog(
//                context: context,
//                builder: (context) => AlertDialog(
//                  title: Text('Submit!'),
//                  content: Text('Everything good?'),
//                  actions: <Widget>[
//                    FlatButton(
//                        child: Icon(Icons.arrow_back),
//                        onPressed: () {
//                          Navigator.pop(context);
//                        }),
//                    FlatButton(
//                      child: Icon(
//                        Icons.playlist_add_check,
//                      ),
//                      onPressed: () {
//                        setState(() {
//                          _isLoading = true;
//                        });
//                        //Adding Stories with Provider..
//                        var _newStory = Story(
//                          title: textFieldTitle,
//                          storyNote: textFieldStoryNote,
//                          id: null,
//                          emoji: selectedFeeling,
//                        );
//                        Provider.of<Stories>(context, listen: false)
//                            .addStory(_newStory)
//                            .then((_) {
//                          setState(() {
//                            _isLoading = false;
//                          });
//                          Navigator.of(context).pushNamed(HomeScreen.routeName);
//                        });
//                      },
//                    ),
//                  ],
//                ),
//              );
              }),
        ),
      ),

      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//            SizedBox(height: 1.0),
                  Container(
                    height: 650,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: Form(
                        key: _form,
                        child: ListView(
                          children: <Widget>[
                            TextFormField(
                              maxLength: 25,
                              decoration: InputDecoration(
                                labelText: 'Story Title',
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_focusNode);
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Cannot be empty :)';
                                }
                                return null;
                              },
                              onChanged: (newText) {
                                textFieldTitle = newText;
                              },
                            ),
                            Container(
//                        margin: EdgeInsets.only(left: 0.0),
                              child: Text(
                                'Your Story:',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            TextFormField(
                              maxLines: 24,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              focusNode: _focusNode,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'No story yet :(';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                textFieldStoryNote = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
    );
  }
}

//margin: EdgeInsets.only(left: 20.0),
