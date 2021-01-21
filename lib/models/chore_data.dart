import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';

class ChoreData extends ChangeNotifier {
  List<ChoreList> _choreListList = [
    ChoreList(title: 'WORK'),
    ChoreList(title: 'Home')
  ];

  //ChoreList _choreList;

  int get choreListCount {
    return _choreListList.length;
  }

  // int get choreCount {
  //   return _choreList.chores.length;
  // }

  //creates a 'window' to look at the list. Safe way of creating a getter for a list
  //and not allowing the use of .add
  List<Chore> getChoreList(int index){
    return choreLists[index].chores;
  }


  UnmodifiableListView<ChoreList> get choreLists =>
      UnmodifiableListView(_choreListList);

  void addChore(int index, Chore chore) {
    _choreListList[index].addChore(chore);
    notifyListeners();
  }

  void toggleChore(Chore chore) {
    chore.toggleDone();
    notifyListeners();
  }

  void deleteChore(int index, Chore chore) {
    _choreListList[index].deleteChore(chore);
    notifyListeners();
  }

  void addChoreList(ChoreList choreList) {
    _choreListList.add(choreList);
    notifyListeners();
  }

  void deleteChoreList(ChoreList choreList) {
    _choreListList.remove(choreList);
    notifyListeners();
  }

  void updateChoreList(ChoreList choreList, String title) {
    choreList.updateChoreList(title);
    notifyListeners();
  }
}
