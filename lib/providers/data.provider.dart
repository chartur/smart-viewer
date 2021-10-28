import 'package:rxdart/rxdart.dart';
import 'package:smart_child_viewer/models/post.model.dart';
import 'package:smart_child_viewer/services/posts.service.dart';

class DataProvider {

  final PostsService _postsService = PostsService();

  static final DataProvider _instant = DataProvider._internal();

  final _posts = BehaviorSubject<List<PostModel>>.seeded([]);

  factory DataProvider() {
    return _instant;
  }

  DataProvider._internal();

  Future loadData() async {
    var res = await _postsService.getPosts();
    print(res.data);
    List<PostModel> posts = res.data.map<PostModel>((data) => PostModel.fromJson(data)).toList();
    this._posts.add(posts);
  }

  Stream get posts$ {
    return _posts.stream;
  }
}