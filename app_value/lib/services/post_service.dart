import 'dart:io';

import 'package:app_value/models/post.dart';
import 'package:app_value/services/interface_post_service.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';

class PostService   implements IpostService {
    final http.Client _client = http.Client();
    final String _BASEURL = "https://jsonplaceholder.typicode.com/posts";
    final int _TIMEOUT = 5;

    Future<List<Post>> get() async {

        final http.Response _response = await http
            .get(Uri.parse(_BASEURL))
            .timeout(Duration(seconds: _TIMEOUT));

        if (_response.statusCode == 200) {
            return List.from(
                json.decode(_response.body)
                    .map((post) => Post
                    .fromJson(post))
            );
        } else {
             throw  const SocketException("No Internet connection");
        }
    }
}