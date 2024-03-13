import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_bookmark_app/model/items_model.dart';

import 'package:save_bookmark_app/bookmark/bookmarks_page.dart';
import 'package:save_bookmark_app/provider/bookmark_provider.dart';
import 'package:save_bookmark_app/provider/bookmark_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List itemsList = [
    {
      'title': 'item 1',
      'subtitle': 'this is item 1',
      'status': 'false',
    },
    {
      'title': 'item 2',
      'subtitle': 'this is item 2',
      'status': 'false',
    },
    {
      'title': 'item 3',
      'subtitle': 'this is item 4',
      'status': 'false',
    },
    {
      'title': 'item 4',
      'subtitle': 'this is item 4',
      'status': 'false',
    }
  ];

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark Flutter"),
        actions: [
          Row(
            children: [
              Text(bookmarkBloc.count.toString()),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const BookmarkPage())));
                  },
                  icon: const Icon(Icons.star))
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      bookmarkBloc.addCount();
                      ItemModel itemModel = ItemModel(
                        title: itemsList[index]['title'],
                        subTitle: itemsList[index]['subtitle'],
                      );

                      bookmarkBloc.addItems(itemModel);

                      if (kDebugMode) {
                        print(bookmarkBloc.items[index].title);
                        print(bookmarkBloc.items.length);
                      }

                      setState(() {
                        itemsList[index]['status'] = "true";
                      });
                    },
                    title: Text(itemsList[index]['title']),
                    subtitle: Text(itemsList[index]['subtitle']),
                    trailing: itemsList[index]['status'] == "false"
                              ? const Icon(Icons.star_border)
                              : const Icon(
                                Icons.star,
                                color: Colors.blue,
                                ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
