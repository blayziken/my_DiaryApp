import 'package:flutter/material.dart';
import '../widgets/stories_list.dart';
import 'package:provider/provider.dart';
import '../provider/story_provider.dart';

class StarredStories extends StatefulWidget {
  static const routeName = '/starred-screen';

  @override
  _StarredStoriesState createState() => _StarredStoriesState();
}

class _StarredStoriesState extends State<StarredStories> {
  bool _showOnlyFavorites = true;
  var _isInit = true;
  var _isLoading = false;

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Stories>(context).fetchStories().then((_) {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 229, 220, 10.0),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40.0, left: 0.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.arrow_back,
                          size: 35.0,
                          color: Colors.orange[600],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Starred Stories',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 40,
            child: Container(
              color: Colors.red,
//                  height: double.infinity,
              height: 900,
              width: 5.0,
            ),
          ),
          Positioned(
            top: 130,
            left: 17,
            right: 0,
            height: 650.0,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                    ),
                  )
                : StoriesList(_showOnlyFavorites),
          ),
        ],
      ),
    );
  }
}
