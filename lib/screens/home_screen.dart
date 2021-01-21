import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/values/theme.dart';
import 'package:we_do_flutter_app/widgets/wedo_list.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//TODO: Create Home Screen
class _HomeScreenState extends State<HomeScreen> {
  // List<WeDoList> listOfWedoLists = <WeDoList>[
  //   WeDoList(weDoListTitle: 'home chores'),
  //   WeDoList(weDoListTitle: 'work stuff'),
  //   WeDoList(weDoListTitle: 'kids weekend chores'),
  //   WeDoList(weDoListTitle: 'home chores'),
  //   WeDoList(weDoListTitle: 'work stuff'),
  //   WeDoList(weDoListTitle: 'kids weekend chores')
  // ];

  List<int> colorCodes = <int>[900, 400, 200];

  //used to return a value for the color swatch
  int getColorCode(int index) => index.remainder(colorCodes.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Names WeDos'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
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
            //TODO: fix addScreens- may need separate screens for add list/add wedo
          );
          //Navigator.pushNamed(context, AddWeDoScreen.id);
        },
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('FIX THIS'),
                tileColor: orangeSwatch[colorCodes[getColorCode(index)]],
                onTap: () {
                  //TODO: open list_detail screen, send wedoList item as argument
                  //Navigator.pushNamed(context, ListDetailScreen.id)

                  print('selected');
                },
                onLongPress: () {
                  //TODO: edit title with bottom navigation?
                  print('long pressed');
                },
              );
            },
          )),
    );
  }
}
