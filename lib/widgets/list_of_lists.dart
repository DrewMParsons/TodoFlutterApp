import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/values/constants.dart';
import 'package:we_do_flutter_app/values/theme.dart';

class ListofLists extends StatelessWidget {
  final List<int> colorCodes = <int>[900, 400, 200];

  //used to return a value for the color swatch
  int getColorCode(int index) => index.remainder(colorCodes.length);
  @override
  Widget build(BuildContext context) {
    return Consumer<ChoreData>(
      builder: (BuildContext context, choreData, Widget child) {
        return choreData.choreLists.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: choreData.choreListCount,
                itemBuilder: (BuildContext context, int index) {
                  ChoreList choreList = choreData.choreLists[index];
                  return Dismissible(
                    background: Container(
                      color: orangeAccent,
                    ),
                    key: Key(choreList.title),
                    onDismissed: (direction) {
                      choreData.deleteChoreList(choreList);
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('${choreList.title} DELETED')));
                    },
                    child: ListTile(
                      title: Text(choreList.title),
                      tileColor: orangeSwatch[colorCodes[getColorCode(index)]],
                      onTap: () {
                        //COMPLETE: open list_detail screen, send wedoList item as argument

                        Navigator.pushNamed(context, WeDoDetailScreen.id,
                            arguments: index);
                        print('selected');
                      },
                      onLongPress: () async {
                        //completed: edit title with bottom navigation?

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
                        choreData.updateChoreList(choreList, newTitle);
                      },
                    ),
                  );
                },
              )
            //Returns a Text widget if the current user has no lists
            : Center(child: Text('Click Add Button to Create a List'));
      },
    );
  }
}
