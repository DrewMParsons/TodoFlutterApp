import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:we_do_flutter_app/models/ChoreList.dart';
import 'package:we_do_flutter_app/models/chore.dart';
import 'package:we_do_flutter_app/util/authentication.dart';

class ChoreData extends ChangeNotifier {
  final firestoreInstance = FirebaseFirestore.instance;
  List<ChoreList> _choreListList = [];

  int get choreListCount {
    return _choreListList.length;
  }

  //creates a 'window' to look at the list. Safe way of creating a getter for a list
  //and not allowing the use of .add
  List<Chore> getChoreList(int index) {
    return choreLists[index].chores;
  }

  UnmodifiableListView<ChoreList> get choreLists =>
      UnmodifiableListView(_choreListList);

  void addChore(int index, Chore chore) {
    firestoreInstance.collection("chores").add({
      "title": chore.title,
      "completed": chore.isDone,
      "list": _choreListList[index].id,
      "createdOn": FieldValue.serverTimestamp(),
    }).then((value) => chore.id = value.id);
    _choreListList[index].addChore(chore);
    notifyListeners();
  }

  void toggleChore(Chore chore) {
    chore.toggleDone();
    firestoreInstance
        .collection("chores")
        .doc(chore.id)
        .set({"completed": chore.isDone}, SetOptions(merge: true));
    notifyListeners();
  }

  void updateChore(Chore chore, String newTitle) {
    firestoreInstance
        .collection("chores")
        .doc(chore.id)
        .set({"title": newTitle}, SetOptions(merge: true));
    chore.updateChore(newTitle);
    notifyListeners();
  }

  void deleteChore(int index, Chore chore) {
    firestoreInstance.collection("chores").doc(chore.id).delete();
    _choreListList[index].deleteChore(chore);
    notifyListeners();
  }

  void addChoreList(ChoreList choreList) {
    firestoreInstance.collection("lists").add({
      "title": choreList.title,
      "owner": choreList.owner,
      "createdOn": FieldValue.serverTimestamp(),
    }).then((value) => choreList.id = value.id);
    _choreListList.add(choreList);
    notifyListeners();
  }

  void deleteChoreList(ChoreList choreList) {
    firestoreInstance.collection("lists").doc(choreList.id).delete();
    _choreListList.remove(choreList);
    notifyListeners();
  }

  void updateChoreList(ChoreList choreList, String title) {
    firestoreInstance
        .collection("lists")
        .doc(choreList.id)
        .set({"title": title}, SetOptions(merge: true));
    choreList.updateChoreList(title);
    notifyListeners();
  }

  void getListofLists(User user) {
    firestoreInstance
        .collection("lists")
        .where("owner", isEqualTo: user.uid)
        .orderBy("createdOn")
        .get()
        .then((querySnaphot) {
      querySnaphot.docs.forEach((element) {
        ChoreList choreList = new ChoreList.fromJson(element.data());
        _choreListList.add(choreList);
      });
    });
  }

  void getList(ChoreList choreList) {
    firestoreInstance
        .collection("chores")
        .where("list", isEqualTo: choreList.id)
        .orderBy("createdOn")
        .get()
        .then((querySnaphot) {
      querySnaphot.docs.forEach((element) {
        Chore chore = new Chore.fromJson(element.data());
        choreList.addChore(chore);
      });
    });
  }

  void getUserLists() {
    for (ChoreList choreList in _choreListList) {
      getList(choreList);
    }
  }
}
