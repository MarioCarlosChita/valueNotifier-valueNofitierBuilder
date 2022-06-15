

import 'package:app_value/models/post.dart';
import 'package:http/http.dart' as http;
abstract class IpostService {
  Future<List<Post>> get() ;
}