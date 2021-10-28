import 'dart:convert';

class PostModel {

  int id;
  int userId;
  String title;
  String body;

  PostModel.fromJson(Map data) {
    if(data == null) {
      data = {};
    }

    id = data['id'];
    userId = data['userId'];
    title = data['title'];
    body = data['body'];
  }

  Map toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body
    };
  }
}