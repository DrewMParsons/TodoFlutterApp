import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';

class AddWeDoScreen extends StatelessWidget {
  static const String id = 'add_wedo_screen';
  static String newWeDoTitle = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Column(
        children: [
          Text(
            (index == -2)
                ? 'Edit Title'
                : (index == -1)
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
            child: Text(index == -2 ? 'EDIT' : 'ADD'),
            onPressed: () {
              //TODO: textfield is not reset after entry.  so clicking add again will create another item of same name
              // happening because we initialize as a static variable to fix null entry error.
              if (newWeDoTitle != null) {
                if (index == -2) {
                  Navigator.pop(context, newWeDoTitle);
                } else {
                  index == -1
                      ? Provider.of<ChoreData>(context, listen: false)
                          .addChoreList(ChoreList(title: newWeDoTitle))
                      : Provider.of<ChoreData>(context, listen: false)
                          .addChore(index, Chore(title: newWeDoTitle));
                  Navigator.pop(context);
                }
              } else {
                print('error');
              }
            },
          )
        ],
      ),
    );
  }
}
