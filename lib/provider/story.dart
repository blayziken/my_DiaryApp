import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Story with ChangeNotifier {
  final String id;
  final String title;
  final Color color;
  final String dateTime;
  final String emoji;
  final String storyNote;
  bool isStarred;

  Story({
    this.id,
    @required this.title,
    this.color,
    this.dateTime,
    this.emoji,
    @required this.storyNote,
    this.isStarred = false,
  });

  void _setStarValue(bool newValue) {
    isStarred = newValue;
    notifyListeners();
  }

  Future<void> toggleStarredStatus(String token) async {
    final oldStatus = isStarred;
    isStarred = !isStarred;
    notifyListeners();
    final url =
        'https://my-diary-f6e0c.firebaseio.com/stories/$id.json?auth=$token';
    try {
      final response = await http.patch(
        url,
        body: json.encode({
          'isStarred': isStarred,
        }),
      );
      if (response.statusCode >= 400) {
        _setStarValue(oldStatus);
      }
    } catch (error) {
      _setStarValue(oldStatus);
    }
  }
}
