// Observer Pattern Example in Dart

// The Observer interface declares the update method, used by subjects.
abstract class Observer {
  void update(String message);
}

// The Subject interface declares a set of methods for managing subscribers.
abstract class Subject {
  void attach(Observer observer);
  void detach(Observer observer);
  void notifyObservers();
}

// The ConcreteSubject owns some important state and notifies observers when the state changes.
class ConcreteSubject implements Subject {
  List<Observer> _observers = [];
  String? _state;

  // Attach an observer to the subject.
  @override
  void attach(Observer observer) {
    _observers.add(observer);
  }

  // Detach an observer from the subject.
  @override
  void detach(Observer observer) {
    _observers.remove(observer);
  }

  // Notify all observers about an event.
  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_state!);
    }
  }

  // A method to change the state of the subject.
  void setState(String state) {
    _state = state;
    notifyObservers();
  }
}

// Concrete Observers react to the updates issued by the Subject they had been attached to.
class ConcreteObserver implements Observer {
  String _name;

  ConcreteObserver(this._name);

  @override
  void update(String message) {
    print('Observer $_name: Received update with message: $message');
  }
}

void main() {
  // Create a subject
  ConcreteSubject subject = ConcreteSubject();

  // Create observers
  ConcreteObserver observer1 = ConcreteObserver('Observer 1');
  ConcreteObserver observer2 = ConcreteObserver('Observer 2');

  // Attach observers to the subject
  subject.attach(observer1);
  subject.attach(observer2);

  // Change the state of the subject
  subject.setState('State 1');
  subject.setState('State 2');

  // Detach an observer
  subject.detach(observer1);

  // Change the state of the subject again
  subject.setState('State 3');
}
