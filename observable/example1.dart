class Observable {
  List<Function(String)> _listeners = [];

  void addListener(Function(String) listener) {
    _listeners.add(listener);
  }

  void notify(String message) {
    for (var listener in _listeners) {
      listener(message);
    }
  }
}

void main() {
  var observable = Observable();
  observable.addListener((msg) => print("Listener 1: $msg"));
  observable.addListener((msg) => print("Listener 2: $msg"));

  observable.notify("Data updated");
}
