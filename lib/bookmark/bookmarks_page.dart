import 'package:save_bookmark_app/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: bookmarkBloc.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return 
                    // color: Colors.lightBlue[200],
                    ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                      hoverColor: Colors.amber[50],
                      tileColor: Colors.yellow[200],
                      title: Text(bookmarkBloc.items[index].title),
                      subtitle: Text(bookmarkBloc.items[index].subTitle),
                    );
                      
              },
            ),
          ],
        ),
      ),
    );
  }
}
