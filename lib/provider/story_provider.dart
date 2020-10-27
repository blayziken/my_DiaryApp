import 'dart:convert';
import 'package:flutter/material.dart';
import 'story.dart';
import 'package:intl/intl.dart';
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
//    ),
//    Story(
//      id: 'S2',
//      title: 'Second Story',
//      storyNote: '222222222222222222222222',
//      dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()),
//      emoji: '🙂',
//    ),
//    Story(
//      id: 'S3',
//      title: 'Third Story',
//      storyNote: '333333333333333333333333',
//      dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()),
//      emoji: '😋',
//    ),
  ];

  var _showFavoritesOnly = false;

  List<Story> get items {
    return [..._items];
  }

  List<Story> get favoriteItems {
    return _items.where((prodItem) => prodItem.isStarred).toList();
  }

  Future<void> fetchStories() async {
    const url = 'https://my-diary-f6e0c.firebaseio.com/stories.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Story> loadedStories = [];
      extractedData.forEach((storyId, storyData) {
        //storyId = Key
        //storyData = Value
//        loadedStories.insert(0, element)
        loadedStories.add(
          Story(
            id: storyId,
            title: storyData['title'],
            storyNote: storyData['storyNote'],
            emoji: storyData['emoji'],
            isStarred: storyData['isStarred'],
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
    const url = 'https://my-diary-f6e0c.firebaseio.com/stories.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': story.title,
          'storyNote': story.storyNote,
          'emoji': story.emoji,
          'isStarred': story.isStarred,
          'dateTime': story.dateTime,
        }),
      );
      final newStory = Story(
        id: json.decode(response.body)['name'],
        title: story.title,
        storyNote: story.storyNote,
        emoji: story.emoji,
//        dateTime: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        dateTime: DateTime.now().toIso8601String(),
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
    final url = 'https://my-diary-f6e0c.firebaseio.com/stories/$id.json';
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
