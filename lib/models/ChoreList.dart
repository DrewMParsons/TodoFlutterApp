import 'package:we_do_flutter_app/models/chore.dart';

class ChoreList {
  //TODO: add created by field
  String title;
  String id;
  String owner;
  List<Chore> chores = [];
  ChoreList({this.title, this.owner});

  ChoreList.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    title = json['title'];
  }

  void addChore(Chore chore) {
    chores.add(chore);
  }

  void deleteChore(Chore chore) {
    chores.remove(chore);
  }

  void updateChore(int index, String newTitle) {
    chores[index].updateChore(newTitle);
  }

  void updateChoreList(String newTitle) {
    title = newTitle;
  }

  int choreCount() {
    return chores.length;
  }
}
