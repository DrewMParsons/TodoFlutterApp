import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/widgets/chore_tile.dart';

class WeDoList extends StatelessWidget {
  int indexOfCurrentList;
  @override
  Widget build(BuildContext context) {
    return Consumer<ChoreData>(
      builder: (BuildContext context, choreData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            ChoreList choreList = choreData.choreLists[indexOfCurrentList];
            Chore chore = choreList.chores[index];
            return ChoreTile(
              isChecked: chore.isDone,
              choreTitle: chore.title,
              checkboxCallback: (checkboxState) {
                choreData.toggleChore(chore);
              },
              longPressCallback: () {
                choreData.deleteChore(indexOfCurrentList, chore);
              },
            );
          },
          itemCount: choreData.choreLists[indexOfCurrentList].chores.length,
        );
      },
    );
  }
}
