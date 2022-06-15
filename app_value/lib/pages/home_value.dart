import 'package:app_value/repository/post_repository.dart';
import 'package:app_value/store/post_state.dart';
import 'package:flutter/cupertino.dart';

class HomeValue extends ValueNotifier<PostState>{
  PostRepository repository;

  HomeValue(this.repository) : super(PostStateLoading());

  Future fetchPosts() async{

     try{

       value  = PostStateLoading();
       final _response = await repository.get();
       value  =PostStateSuccess(list: _response);
     } catch(e) {
       print(e);
       value =PostStateError(message: e.toString());
     }
  }
}