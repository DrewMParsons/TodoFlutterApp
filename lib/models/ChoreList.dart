import 'package:we_do_flutter_app/models/chore.dart';

class ChoreList {
  //TODO: add created by field
  String title;
  List<Chore> chores = [];
  ChoreList({this.title});

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
