class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }
  Singleton._internal();
}

class Database {
  static final Database _instance = Database._internal();

  Database._internal();

  factory Database() {
    return _instance;
  }
}
