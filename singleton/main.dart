import 'singleton.dart';

void main() {
  var s1 = Singleton();
  var s2 = Singleton();

  print(identical(s1, s2)); // true
}

//  In the above code, we have created a Singleton class with a private constructor and a static instance of the class. We have also created a factory constructor that returns the instance of the class. 
//  When we create two instances of the Singleton class, the factory constructor will return the same instance of the class. 
//  2. Singleton with Lazy Initialization 
//  In the above example, the instance of the Singleton class is created when the class is loaded. If we want to create the instance of the Singleton class only when it is required, we can use lazy initialization.
