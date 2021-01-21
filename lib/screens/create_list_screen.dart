import 'package:flutter/material.dart';

class CreateListScreen extends StatefulWidget {
  static const String id = 'create_list_screen';

  @override
  _CreateListScreenState createState() => _CreateListScreenState();
}

//TODO: Create list Screen- DO we need this?
class _CreateListScreenState extends State<CreateListScreen> {
  String listTitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(),
    );
  }
}
