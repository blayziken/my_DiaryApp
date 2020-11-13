import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/story_provider.dart';

class AddStory2 extends StatefulWidget {
  @override
  _AddStory2State createState() => _AddStory2State();
}

class _AddStory2State extends State<AddStory2> {
  final _focusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String textFieldTitle;
  String textFieldStoryNote;
  String selectedFeeling = '😁';

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
              onPressed: () {
                Provider.of<Stories>(context, listen: false).printItems();
              }
              //Adding Stories with Provider..

              ),
        ),
      ),

      body: SingleChildScrollView(
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
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//margin: EdgeInsets.only(left: 20.0),
