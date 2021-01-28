import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/chore_data.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/values/constants.dart';
import 'package:we_do_flutter_app/values/theme.dart';
import 'package:we_do_flutter_app/widgets/list_of_lists.dart';
import 'package:we_do_flutter_app/widgets/wedo_list.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int numberOfLists = Provider.of<ChoreData>(context).choreListCount;
    return Scaffold(
      appBar: AppBar(
        title: numberOfLists == 1
            ? Text('User Name:  $numberOfLists List')
            : Text('User Name:  $numberOfLists Lists'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
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
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddWeDoScreen())),
            routeSettings: RouteSettings(arguments: newItem),
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListofLists(),
      ),
    );
  }
}
