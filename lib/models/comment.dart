import 'package:courses_app/models/post.dart';

class CommentModel extends PostModel {
  int? idComment;
  String? name;
  String? email;
  String? body;
  CommentModel({this.idComment, this.name, this.email, this.body, super.id});
  factory CommentModel.fromJsonAndObject(
      Map<String, dynamic> json, PostModel p) {
    return CommentModel(
        idComment: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body'],
        id: p.id);
  }
}
