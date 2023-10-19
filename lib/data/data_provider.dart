import 'package:courses_app/models/post.dart';
import 'package:courses_app/services/APIServices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//watch userProvider ref to getUser();
final postDataProvider = FutureProvider<List<PostModel>>(
    (ref) async => ref.watch(postProvider).getUsers());
