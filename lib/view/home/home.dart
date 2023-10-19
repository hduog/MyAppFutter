import 'package:courses_app/models/post.dart';
import 'package:courses_app/services/APIServices.dart';
import 'package:courses_app/view/home/conponent/ListItem.dart';
import 'package:courses_app/view/home/conponent/TopNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../data/data_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(postProvider).getUsers();
    return Scaffold(
      appBar: TopNavigator(),
      body: ContainerMain(_data),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        color: Color.fromARGB(255, 76, 120, 196),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GNav(
              backgroundColor: Color.fromARGB(255, 76, 120, 196),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.favorite_border, text: 'Love'),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(icon: Icons.settings, text: 'Setting'),
              ]),
        ),
      ),
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
