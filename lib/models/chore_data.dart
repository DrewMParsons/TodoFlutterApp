import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:we_do_flutter_app/models/chore.dart';

class ChoreData extends ChangeNotifier {
  List<Chore> choreList = [
    Chore(title: 'list of chores'),
    Chore(title: 'check me to finish'),
    Chore(title: 'click to add ')
  ];

  int get choreCount {
    return choreList.length;
  }

  //creates a 'window' to look at the list. Safe way of creating a getter for a list
  //and not allowing the use of .add
  //UnmodifiableListView<Chore> get chores => UnmodifiableListView(_choreList);

  void addChore(Chore chore) {
    choreList.add(chore);
    notifyListeners();
  }

  void toggleChore(Chore chore) {
    chore.toggleDone();
    notifyListeners();
  }

  void deleteChore(Chore chore) {
    choreList.remove(chore);
    notifyListeners();
  }
}
