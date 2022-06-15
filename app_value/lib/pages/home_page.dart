import 'package:app_value/models/post.dart';
import 'package:app_value/pages/home_value.dart';
import 'package:app_value/repository/post_repository.dart';
import 'package:app_value/services/post_service.dart';
import 'package:app_value/store/post_state.dart';
import 'package:flutter/material.dart';

class  HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {

  final HomeValue _homeValue = HomeValue(PostRepository(PostService()));

 @override
  void initState() {
   super.initState();
   onInitLoad();
  }

  void onInitLoad(){
   _homeValue.fetchPosts();
  }

  @override
  void dispose(){
      _homeValue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:ValueListenableBuilder<PostState>(
           valueListenable: _homeValue,
           builder: (context , value , child) {

              if (value is  PostStateLoading) {
                   return  const Center(
                       child: CircularProgressIndicator(),
                   );
              }

              if (value is PostStateSuccess){
                List<Post> lista = value.list;
                return  Center(child: Text("${lista.length}"),);
              }

              if (value is PostStateError){
                   return const Center(
                      child: Text("Server Error Connections"),
                   );
              }
              return const SizedBox.shrink();

           }
       )
    );
  }
}
