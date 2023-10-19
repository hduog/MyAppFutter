import 'package:courses_app/models/post.dart';
import 'package:flutter/material.dart';

ListView ItemCards(AsyncSnapshot<List<PostModel>> snapshot) {
  final List<PostModel> posts = snapshot.data!;
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final PostModel post = posts[index];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(children: [
            Container(
                width: 100,
                height: 90,
                margin: new EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Đặt bán kính bo tròn
                  child: Image.network(
                    post.thumbnailUrl.toString(),
                    fit: BoxFit.fill,
                  ),
                )),
            Text('Id: ' + post.id.toString(),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500))
          ]),
          //define a cardview

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                  width: 200,
                  height: 20,
                  child: Text(
                    'Descriptions: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: Text(
                    post.title.toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 154, 126, 25), fontSize: 12),
                  )),
              const SizedBox(
                  width: 200,
                  height: 20,
                  child: Text(
                    'View Detail',
                    style: TextStyle(color: Color.fromARGB(255, 124, 47, 47)),
                  ))
            ],
          ),
        ],
      );
    },
  );
}
