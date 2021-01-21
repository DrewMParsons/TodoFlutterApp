import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';

class AddWeDoScreen extends StatelessWidget {
  static const String id = 'add_wedo_screen';
  int index;


  AddWeDoScreen(this.index);

  @override
  Widget build(BuildContext context) {
    String newWeDoTitle;
    return Container(
      child: Column(
        children: [
          Text(
            'New WeDo',
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
            onChanged: (value) {
              newWeDoTitle = value;
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).accentColor),
            child: Text('ADD'),
            onPressed: () {
              //TODO: fix null check and closing of the keyboard errors
              if (newWeDoTitle != null) {
                Provider.of<ChoreData>(context, listen: false)
                    .addChore(index,Chore(title: newWeDoTitle));
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
