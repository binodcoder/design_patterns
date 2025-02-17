abstract class IAnimal {
  void speak();
}

class Dog implements IAnimal {
  @override
  void speak() {
    print("Woof!");
  }
}

class Cat implements IAnimal {
  @override
  void speak() {
    print("Mewo");
  }
}

class AnimalFactory {
  static IAnimal createAnimal(String type) {
    if (type == 'dog') return Dog();
    if (type == 'cat') return Cat();
    throw Exception('Unknown animal');
  }
}

void main() {
  var dog = AnimalFactory.createAnimal('dog');
  dog.speak();
}
