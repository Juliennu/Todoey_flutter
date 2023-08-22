class Task {
  String title;
  bool isDone;

  // isDone に初期値を設定
  Task(this.title, {this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
