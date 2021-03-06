import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/models/ChoreData.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/values/constants.dart';
import 'package:we_do_flutter_app/values/theme.dart';
import 'package:we_do_flutter_app/widgets/chore_tile.dart';

class WeDoList extends StatelessWidget {
  final int indexOfCurrentList;

  const WeDoList({Key key, @required this.indexOfCurrentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChoreData>(
      builder: (BuildContext context, choreData, Widget child) {
        return choreData.choreLists[indexOfCurrentList].choreCount() != 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  ChoreList choreList =
                      choreData.choreLists[indexOfCurrentList];
                  Chore chore = choreList.chores[index];
                  return Dismissible(
                    background: Container(
                      color: orangeAccent,
                    ),
                    key: Key(chore.title),
                    onDismissed: (direction) {
                      choreData.deleteChore(indexOfCurrentList, chore);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('${chore.title} DELETED')));
                    },
                    child: ChoreTile(
                      isChecked: chore.isDone,
                      choreTitle: chore.title,
                      checkboxCallback: (checkboxState) {
                        choreData.toggleChore(chore);
                      },
                      longPressCallback: () async {
                        String newTitle = await showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          context: context,
                          isDismissible: false,
                          builder: (context) => AddWeDoScreen(),
                          routeSettings: RouteSettings(arguments: editItem),
                        );
                        print(newTitle);
                        choreData.updateChore(chore, newTitle);
                      },
                    ),
                  );
                },
                itemCount:
                    choreData.choreLists[indexOfCurrentList].chores.length,
              )
            //Returns a Text widget if the current list is empty
            : Center(child: Text('Click Add Button to Create a new Chore'));
      },
    );
  }
}
