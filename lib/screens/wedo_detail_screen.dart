import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/widgets/wedo_list.dart';
import 'add_wedo_screen.dart';

class WeDoDetailScreen extends StatelessWidget {
  static const String id = 'list_detail_screen';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          //TODO: dynamically update Title in AppBar
          title: Text(
              '${Provider.of<ChoreData>(context).choreLists[index].title}'),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              context: context,
              builder: (context) => AddWeDoScreen(),
              routeSettings: RouteSettings(arguments: index),
            );
          },
        ),
        // TODO: Add sharable button- to appBar or body?
        body: Column(
          children: [
            Container(
                child: Text(
                    '${Provider.of<ChoreData>(context).choreLists[index].chores.length} Chores')),
            Expanded(
              child: Container(
                child: WeDoList(
                  indexOfCurrentList: index,
                ),
              ),
            ),
          ],
        ));
  }
}
