import 'package:flutter/material.dart';
import 'package:my_DiaryApp/provider/story_provider.dart';
import '../widgets/stories_list.dart';
import 'package:provider/provider.dart';
import '../widgets/FABCustom.dart';
import '../provider/story_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Stories>(context).fetchStories().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
//    final productsContainer = Provider.of<Stories>(context, listen: false);

//    int storyLength = Provider.of<Stories>(context).getItemsLength();
    String storyOrStories;

    if (Provider.of<Stories>(context).getItemsLength() < 2) {
      storyOrStories = 'Story';
    } else {
      storyOrStories = 'Stories';
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 900,
        child: Stack(
          children: <Widget>[
            // GIRL WITH PHONE IMAGE
            Positioned(
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/girl4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 20,
              left: 390,
              child: PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favorites) {
                      _showOnlyFavorites = true;
//                    productsContainer.showFavoritesOnly();
                    } else {
                      _showOnlyFavorites = false;
//                    productsContainer.showAll();
                    }
                  });
                },
                icon: Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text('Show All'),
                    value: FilterOptions.All,
                  )
                ],
              ),
            ),
            // FLOATING ACTION BUTTON
            Positioned(
              top: 200,
              left: 270,
//            right: 20.0,
//                child: CircleAvatar(
//                  backgroundColor: Colors.red,
//                )
              child: CustomFAB(),
            ),

            // TITLE, DATE AND LINE
            Positioned(
              top: 340,
              left: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'My Diary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'You have ${Provider.of<Stories>(context).getItemsLength()} $storyOrStories',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: 1.5,
                    width: 350.0,
                  ),
                ],
              ),
            ),

            // STRAIGHT RED LINE
            Positioned(
              top: 244,
              child: Container(
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                color: Colors.red,
//                  height: double.infinity,
                height: 900,
                width: 4.0,
              ),
            ),

            // NOTES CARD
            Positioned(
              top: 430,
              left: 7,
              height: 400,
              width: 420,
//              child: StoryList(),
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
      ),
    );
  }
}
