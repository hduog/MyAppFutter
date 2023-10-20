import 'dart:convert';
import 'dart:ffi';
import 'package:courses_app/models/card.dart';
import 'package:courses_app/models/comment.dart';
import 'package:courses_app/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class APIServices {
  // function get all card
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

//function get detail post
  String endpointcard = "https://jsonplaceholder.typicode.com/posts/";
  Future<CardModel> getCardUsers(String pram, PostModel p) async {
    var response_card =
        await http.get(Uri.parse(endpointcard + (pram.toString())));
    if (response_card.statusCode == 200) {
      final dynamic responseData = jsonDecode(response_card.body);
      return CardModel.fromJsonAndRefObject(responseData, p);
    } else {
      throw Exception(response_card.reasonPhrase);
    }
  }

  // function get all comment of post
  String endpointcoment = "https://jsonplaceholder.typicode.com/posts/";
  Future<List<CommentModel>> getCommentOfPost(String pram, PostModel p) async {
    var response = await http.get(Uri.parse('$endpointcoment$pram/comments'));
    //check condition of status respone data of server
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result
          .map((cmt) => CommentModel.fromJsonAndObject(cmt, p))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//CREATE A PROVIDER contain APISERVICES CALSS
final postProvider = Provider<APIServices>((ref) => APIServices());
