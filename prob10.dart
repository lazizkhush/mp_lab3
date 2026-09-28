// Listing 10: Polymorphism

// ============================================================
// Problem 1: Runtime Polymorphic Dispatch
// ============================================================

abstract interface class PaymentProcessor {
  void process(double amount);
}

class CreditCardProcessor implements PaymentProcessor {
  @override
  void process(double amount) {
    print('Paid \$$amount via Credit Card');
  }
}

class CryptoProcessor implements PaymentProcessor {
  @override
  void process(double amount) {
    print('Paid \$$amount via Crypto Wallet');
  }
}

void checkout(PaymentProcessor p, double amount) {
  p.process(amount);
}

// ============================================================
// Problem 2: Polymorphic Shape List
// ============================================================

abstract class Shape {
  double area();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// ============================================================
// Problem 3: Runtime Type Checks using "is" and "as"
// ============================================================

void checkShape(Shape shape) {
  // "is" checks whether an object is a specific type.
  if (shape is Circle) {
    print('This shape is a Circle.');
    print('Radius: ${shape.radius}');
  }

  if (shape is Rectangle) {
    print('This shape is a Rectangle.');
  }

  // "as" performs an explicit type cast.
  if (shape is Circle) {
    final circle = shape as Circle;
    print('Circle radius after casting: ${circle.radius}');
  }
}

// ============================================================
// Problem 4: Parametric Polymorphism with Repository<T>
// ============================================================

class Repository<T> {
  final List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  T get(int index) {
    return _items[index];
  }

  List<T> getAll() {
    return List.unmodifiable(_items);
  }
}

// ============================================================
// Problem 5: Sealed Classes + Exhaustive Pattern Matching
// ============================================================

sealed class Result {}

class Success extends Result {
  final String message;

  Success(this.message);
}

class Failure extends Result {
  final String error;

  Failure(this.error);
}

class Loading extends Result {}

String handleResult(Result result) {
  return switch (result) {
    Success(:final message) => 'Success: $message',
    Failure(:final error) => 'Failure: $error',
    Loading() => 'Loading...',
  };
}

// ============================================================
// Main
// ============================================================

void main() {
  // ----------------------------------------------------------
  // Problem 1
  // ----------------------------------------------------------

  print('--- Problem 1 ---');

  final PaymentProcessor creditCard = CreditCardProcessor();
  final PaymentProcessor crypto = CryptoProcessor();

  checkout(creditCard, 100);
  checkout(crypto, 50);

  // ----------------------------------------------------------
  // Problem 2
  // ----------------------------------------------------------

  print('\n--- Problem 2 ---');

  final List<Shape> shapes = [
    Circle(5),
    Rectangle(10, 4),
    Circle(3),
    Rectangle(6, 2),
  ];

  for (final shape in shapes) {
    print('Area: ${shape.area()}');
  }

  // ----------------------------------------------------------
  // Problem 3
  // ----------------------------------------------------------

  print('\n--- Problem 3 ---');

  final Shape circle = Circle(10);
  final Shape rectangle = Rectangle(5, 3);

  checkShape(circle);
  checkShape(rectangle);

  // ----------------------------------------------------------
  // Problem 4
  // ----------------------------------------------------------

  print('\n--- Problem 4 ---');

  final Repository<String> names = Repository<String>();

  names.add('Ali');
  names.add('John');
  names.add('David');

  print('Names: ${names.getAll()}');
  print('First name: ${names.get(0)}');

  final Repository<int> numbers = Repository<int>();

  numbers.add(10);
  numbers.add(20);
  numbers.add(30);

  print('Numbers: ${numbers.getAll()}');
  print('First number: ${numbers.get(0)}');

  // ----------------------------------------------------------
  // Problem 5
  // ----------------------------------------------------------

  print('\n--- Problem 5 ---');

  final Result result1 = Success('Payment completed');
  final Result result2 = Failure('Payment declined');
  final Result result3 = Loading();

  print(handleResult(result1));
  print(handleResult(result2));
  print(handleResult(result3));
}