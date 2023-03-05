import 'package:rest_api_practice/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteSevice
{
  // ignore: body_might_complete_normally_nullable
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200)
    {
      var json = response.body;
       postFromJson(json);
    }
  }
}