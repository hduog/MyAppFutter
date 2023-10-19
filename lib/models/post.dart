// ignore_for_file: empty_constructor_bodies

class PostModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  // constructor
  PostModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
