import 'package:courses_app/models/card.dart';
import 'package:courses_app/models/comment.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SingleChildScrollView BodyDetail(data, detail, comment, context) {
  return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          FutureBuilder<CardModel>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text("An error occurred");
              } else if (snapshot.hasData) {
                return Container(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(detail.url.toString()),
                          Text('Title: ${detail.title}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                          const Text('Descriptions:',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              )),
                          Text(snapshot.data!.body.toString()),
                          const Text('Comments:',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              )),
                          BodyComment(comment)
                        ],
                      ),
                      // BodyComment(comment)
                    ],
                  ),
                );
              } else {
                return const Text("No data available");
              }
            },
          )
        ],
      ));
}

//define a comment
List<Widget> renderComments(List<CommentModel> comments) {
  List<Widget> commentWidgets = [];
  comments.forEach((element) {
    commentWidgets.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element.email.toString(),
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              Text(
                element.name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(element.body.toString()),
            ],
          ),
        ),
      ],
    ));
  });
  return commentWidgets;
}

// ignore: non_constant_identifier_names
Padding BodyComment(comment) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: FutureBuilder<List<CommentModel>>(
      future: comment,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("An error occurred");
        } else if (snapshot.hasData) {
          final List<CommentModel> comments = snapshot.data!;
          return Column(children: renderComments(comments));
        } else {
          return const Text("No data available");
        }
      },
    ),
  );
}
