
import 'package:app_value/models/post.dart';

abstract class PostState{}


class PostStateLoading extends PostState{}

class  PostStateError extends PostState {
   String message;
   PostStateError({required this.message});
}


class  PostStateSuccess extends PostState{
      List<Post>  list;
      PostStateSuccess({required  this.list});
}

