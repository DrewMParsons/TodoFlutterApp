import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_do_flutter_app/models/ChoreData.dart';
import 'package:we_do_flutter_app/screens/add_wedo_screen.dart';
import 'package:we_do_flutter_app/screens/wedo_detail_screen.dart';
import 'package:we_do_flutter_app/screens/welcome_screen.dart';
import 'package:we_do_flutter_app/util/authentication.dart';
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
  User currentUser;
  @override
  void initState() {
    // TODO: implement initState
    currentUser = Authentication().auth.currentUser;
    ChoreData().getListofLists(currentUser);
    ChoreData().getUserLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final Map args = ModalRoute.of(context).settings.arguments;
    //final User currentUser = Authentication().auth.currentUser;
    //ChoreData().getList(currentUser);
    // if (args != null) {
    //   currentUser = args['currentUser'];
    // }
    int numberOfLists = Provider.of<ChoreData>(context).choreListCount;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Authentication().signOut();
            Navigator.pushNamed(context, WelcomeScreen.id);
          },
        ),
        title: numberOfLists == 1
            ? Text('${currentUser.displayName}  $numberOfLists List')
            : Text('${currentUser.displayName}  $numberOfLists Lists'),
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
