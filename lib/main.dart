import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_bookmark_app/bookmark/home_page.dart';
import 'package:save_bookmark_app/provider/bookmark_provider.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => BookmarkBloc(),
  child:const MyApp(),
  ));
 

 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: "Bookmark Flutter",
     );
   }
 }