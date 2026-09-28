class Singleton {
  // The single instance of the class
  static final Singleton _instance = Singleton._internal();

  // Private constructor
  Singleton._internal();

  // Factory constructor
  factory Singleton() {
    return _instance;
  }
}

void main() {
  final object1 = Singleton();
  final object2 = Singleton();

  print(identical(object1, object2)); // true
}