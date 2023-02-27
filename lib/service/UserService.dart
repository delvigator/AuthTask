import '../models/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class UserService{
  Future<User?> getUser(String username,String password) async {
    print(username);
    var client=http.Client();
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    var uri=Uri.parse('http://localhost/hrm/hs/api/mw/login');
    final body={
      "login": stringToBase64.encode(username),
      "password": stringToBase64.encode(password)
    };
    var response=await http.post(uri,
        headers: {
          'Authorization' : 'Basic 0KHQvtC70L7Qv9C+0LLQsNCeOjE3NzY=',
          'Content-Type' : 'application/json',
        },
        body: jsonEncode(body));
    // if(response.statusCode==200){
    var json=jsonDecode(response.body);
    // final Map<String, dynamic> _map = jsonDecode(
    //     utf8.decode(response.bodyBytes));
    //print(_map);

    if (response.statusCode == 200) {
      return User.fromJson(json);
    }
    // }
    //return null;

  }
}