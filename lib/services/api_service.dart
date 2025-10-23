import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static final _base = Uri.parse('https://jsonplaceholder.typicode.com');

  static Future<List<Post>> fetchPosts() async {
    final uri = _base.replace(path: '/posts');
    final resp = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'FlutterStudent/1.0',
      },
    );

    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body) as List;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts (status ${resp.statusCode})');
    }
  }
}
