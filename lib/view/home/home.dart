import 'package:courses_app/models/post.dart';
import 'package:courses_app/services/APIServices.dart';
import 'package:courses_app/view/home/conponent/BottomBar.dart';
import 'package:courses_app/view/home/conponent/ListItem.dart';
import 'package:courses_app/view/home/conponent/TopNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(postProvider).getUsers();

    return Scaffold(
      appBar: TopNavigator(context),
      body: ContainerMain(_data),
      bottomNavigationBar: BottomBar(),
    );
  }

  Center ContainerMain(Future<List<PostModel>> data) {
    return Center(
        child: FutureBuilder<List<PostModel>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("An error occurred");
        } else if (snapshot.hasData) {
          return ItemCards(snapshot);
        } else {
          return const Text("No data available");
        }
      },
    ));
  }
  // ignore: non_constant_identifier_names
}
