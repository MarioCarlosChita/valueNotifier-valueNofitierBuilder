

import 'package:app_value/models/post.dart';
import 'package:app_value/services/post_service.dart';

class PostRepository {
    PostService  postService;
    PostRepository(this.postService);

    Future<List<Post>> get() async =>  await postService.get();
}