import 'dart:convert';
import 'dart:ffi';
import 'package:courses_app/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class APIServices {
  String endpoint = "https://jsonplaceholder.typicode.com/photos";
  Future<List<PostModel>> getUsers() async {
    var response = await http.get(Uri.parse(endpoint));
    //check condition of status respone data of server
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((prod) => PostModel.fromJson(prod)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//CREATE A PROVIDER contain APISERVICES CALSS
final postProvider = Provider<APIServices>((ref) => APIServices());
