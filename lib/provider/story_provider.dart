import 'dart:convert';
import 'package:flutter/material.dart';
import 'story.dart';
import 'package:http/http.dart' as http;
import '../model/http_exception.dart';

class Stories with ChangeNotifier {
  List<Story> _items = [
//    Story(
//      id: 'S1',
//      title: 'First Story',
//      storyNote: '1111111111111111111111111111111',
//      dateTime: DateTime.now(),
//      emoji: '😁',
//    )
  ];

  var _showFavoritesOnly = false;

  final String authToken;
  final String userId;

  Stories(this.authToken, this.userId, this._items);

  List<Story> get items {
    return [..._items.reversed];
//    _items.sort()
  }

  List<Story> get favoriteItems {
    return _items.where((prodItem) => prodItem.isStarred).toList();
  }

  Future<void> fetchStories() async {
    var url =
        'https://my-diary-f6e0c.firebaseio.com/stories.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      url =
          'https://my-diary-f6e0c.firebaseio.com/userFavorites/$userId/.json?auth=$authToken';

      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<Story> loadedStories = [];
      print('------------------------');
      print(extractedData);
      extractedData.forEach((storyId, storyData) {
        loadedStories.add(
          Story(
            id: storyId,
            title: storyData['title'],
            storyNote: storyData['storyNote'],
            emoji: storyData['emoji'],
            isStarred:
                favoriteData == null ? false : favoriteData[storyId] ?? false,
            dateTime: storyData['dateTime'],

//            storyData['dateTime'],
          ),
        );
      });
      _items = loadedStories;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addStory(Story story) async {
    final url =
        'https://my-diary-f6e0c.firebaseio.com/stories.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': story.title,
          'storyNote': story.storyNote,
          'emoji': story.emoji,
          'dateTime': DateTime.now().toIso8601String(),
          'creatorId': userId,
        }),
      );
      final newStory = Story(
        id: json.decode(response.body)['name'],
        title: story.title,
        storyNote: story.storyNote,
        emoji: story.emoji,
//        dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()), //didn't use
//        dateTime: DateTime.now().toString(), //didn't use
      );
      _items.add(newStory);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Story findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> deleteStory(String id) async {
    final url =
        'https://my-diary-f6e0c.firebaseio.com/stories/$id.json?auth=$authToken';
    final existingStoryIndex = _items.indexWhere((element) => element.id == id);
    var existingStory = _items[existingStoryIndex];

    _items.removeAt(existingStoryIndex);
    notifyListeners();
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(existingStoryIndex, existingStory);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }

    existingStory = null;
  }

  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  int getItemsLength() {
    return _items.length;
  }
}
