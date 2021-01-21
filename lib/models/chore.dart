class Chore {
  String title;
  bool isDone;

  Chore({this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  void updateChore(String title) {
    this.title = title;
  }
}
