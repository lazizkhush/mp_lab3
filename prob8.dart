// ============================================================
// Problem 1
// Demonstrate class extension, super constructors,
// and method overriding.
// ============================================================

class Vehicle {
  final String brand;

  Vehicle(this.brand);

  void start() => print('$brand starting...');
}

class ElectricCar extends Vehicle {
  final int batteryCapacity;

  ElectricCar(String brand, this.batteryCapacity) : super(brand);

  @override
  void start() {
    super.start();
    print('Battery level: $batteryCapacity kWh');
  }
}


// ============================================================
// Problem 2
// Create a base class Animal and a derived class Dog
// overriding a makeSound() method.
// ============================================================

class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog says: Woof!');
  }
}


// ============================================================
// Problem 3
// Demonstrate super-initializer parameters syntax.
// ============================================================

class ElectricCar2 extends Vehicle {
  final int batteryCapacity;

  // `super(brand)` can be replaced with `super.brand`
  // using a super-initializer parameter.
  ElectricCar2(super.brand, this.batteryCapacity);

  @override
  void start() {
    print('$brand starting...');
    print('Battery level: $batteryCapacity kWh');
  }
}


// ============================================================
// Problem 4
// Multi-level inheritance:
// Shape → Polygon → Triangle
// ============================================================

class Shape {
  void describe() {
    print('This is a shape.');
  }
}

class Polygon extends Shape {
  final int sides;

  Polygon(this.sides);

  void showSides() {
    print('Number of sides: $sides');
  }
}

class Triangle extends Polygon {
  Triangle() : super(3);

  void identify() {
    print('This is a triangle.');
  }
}


// ============================================================
// Problem 5
// Abstract base class with concrete and abstract methods.
// ============================================================

abstract class Shape2 {
  // Concrete method
  void describe() {
    print('This is a shape.');
  }

  // Abstract method
  double calculateArea();
}

class Rectangle extends Shape2 {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  // Must be implemented because Shape2 requires it.
  @override
  double calculateArea() {
    return width * height;
  }
}


// ============================================================
// Main
// ============================================================

void main() {
  print('--- Problem 1 ---');

  final car = ElectricCar('Tesla', 75);
  car.start();


  print('\n--- Problem 2 ---');

  final dog = Dog();
  dog.makeSound();


  print('\n--- Problem 3 ---');

  final car2 = ElectricCar2('BMW', 80);
  car2.start();


  print('\n--- Problem 4 ---');

  final triangle = Triangle();
  triangle.describe();
  triangle.showSides();
  triangle.identify();


  print('\n--- Problem 5 ---');

  final rectangle = Rectangle(10, 5);
  rectangle.describe();
  print('Area: ${rectangle.calculateArea()}');
}