import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/values/theme.dart';

class ListofLists extends StatelessWidget {
  final List<int> colorCodes = <int>[900, 400, 200];

  //used to return a value for the color swatch
  int getColorCode(int index) => index.remainder(colorCodes.length);
  @override
  Widget build(BuildContext context) {
    return Consumer<ChoreData>(
      builder: (BuildContext context, choreData, Widget child) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: choreData.choreListCount,
          itemBuilder: (BuildContext context, int index) {
            ChoreList choreList = choreData.choreLists[index];
            return ListTile(
              title: Text(choreList.title),
              tileColor: orangeSwatch[colorCodes[getColorCode(index)]],
              onTap: () {
                //COMPLETE: open list_detail screen, send wedoList item as argument
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeDoDetailScreen(
                              index: index,
                            )));

                print('selected');
              },
              onLongPress: () {
                //TODO: edit title with bottom navigation?
                print('long pressed');
              },
            );
          },
        );
      },
    );
  }
}
