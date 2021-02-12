import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/values/constants.dart';

class AddWeDoScreen extends StatefulWidget {
  static const String id = 'add_wedo_screen';

  @override
  _AddWeDoScreenState createState() => _AddWeDoScreenState();
}

class _AddWeDoScreenState extends State<AddWeDoScreen> {
  String newWeDoTitle;
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Column(
        children: [
          Text(
            (index == editItem)
                ? 'Edit Title'
                : (index == newItem)
                    ? 'New List'
                    : 'New WeDo',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 4.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor, width: 4.5),
              ),
            ),
            onChanged: (String value) {
              newWeDoTitle = value;
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).accentColor),
            child: Text(index == editItem ? 'EDIT' : 'ADD'),
            onPressed: () async {
              if (newWeDoTitle != null) {
                if (index == editItem) {
                  Navigator.pop(context, newWeDoTitle);
                } else {
                  index == newItem
                      ? Provider.of<ChoreData>(context, listen: false)
                          .addChoreList(ChoreList(title: newWeDoTitle))
                      : Provider.of<ChoreData>(context, listen: false)
                          .addChore(index, Chore(title: newWeDoTitle));
                  Navigator.pop(context);
                }
              } else {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: Text('Title cannot be empty'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
