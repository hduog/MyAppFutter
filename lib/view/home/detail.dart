// ignore_for_file: non_constant_identifier_names

import 'package:courses_app/models/card.dart';
import 'package:courses_app/models/post.dart';
import 'package:courses_app/services/APIServices.dart';
import 'package:courses_app/view/home/conponent/BodyDetail.dart';
import 'package:courses_app/view/home/conponent/BottomBar.dart';
import 'package:courses_app/view/home/conponent/TopNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.detail});
  final PostModel detail;

  @override
  Widget build(BuildContext context, ref) {
    final _data =
        ref.watch(postProvider).getCardUsers(detail.id.toString(), detail);
    final _comment =
        ref.watch(postProvider).getCommentOfPost(detail.id.toString(), detail);
    return Scaffold(
      appBar: TopNavigator(context),
      body: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: SafeArea(child: BodyDetail(_data, detail, _comment, context))),
      bottomNavigationBar: BottomBar(),
    );
  }
}
