import 'package:courses_app/models/post.dart';

class CardModel extends PostModel {
  int? userId;
  String? body;
  CardModel(
      {this.userId,
      this.body,
      super.albumId,
      super.id,
      super.thumbnailUrl,
      super.title,
      super.url});
  factory CardModel.fromJsonAndRefObject(
      Map<String, dynamic> json, PostModel p) {
    return CardModel(
      userId: json['userId'],
      body: json['body'],
      albumId: p.albumId,
      id: p.id,
      thumbnailUrl: p.thumbnailUrl,
      title: p.title,
      url: p.url,
    );
  }
}
