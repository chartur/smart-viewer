import 'package:dio/dio.dart';
import 'package:smart_child_viewer/services/SVService.dart';

class PostsService extends SVService {

  PostsService(){
    dio = Dio();
  }

  Future getPosts() {
    return dio.get('https://jsonplaceholder.typicode.com/posts');
  }
}