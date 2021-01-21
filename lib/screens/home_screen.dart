import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/values/theme.dart';
import 'package:we_do_flutter_app/widgets/list_of_lists.dart';
import 'package:we_do_flutter_app/widgets/wedo_list.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//TODO: Create Home Screen
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'User Name: ${Provider.of<ChoreData>(context).choreListCount}  Lists'),
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
          //TODO: alert dialog to add new list
          print('FIX ME');
          // showModalBottomSheet(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20.0),
          //       topRight: Radius.circular(20.0),
          //     ),
          //   ),
          //   context: context,
          //   builder: (context) => AddWeDoScreen(),
          //   //TODO: fix addScreens- may need separate screens for add list/add wedo
          // );
          //Navigator.pushNamed(context, AddWeDoScreen.id);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListofLists(),
      ),
    );
  }
}
