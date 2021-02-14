class Chore {
  String title;
  String id;
  bool isDone;
  //TODO: add created by and finished by functionality

  Chore({this.title, this.isDone = false});

  Chore.fromJson(Map<String, dynamic> json) {
    isDone = json['completed'];
    title = json['title'];
  }

  void toggleDone() {
    isDone = !isDone;
  }

  void updateChore(String title) {
    this.title = title;
  }
}
