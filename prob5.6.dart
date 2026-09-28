/// A utility class for performing basic calculations.
///
/// The [Calculator] class provides methods for adding, subtracting,
/// multiplying, and dividing numbers.
///
/// Example:
/// ```dart
/// final calculator = Calculator();
///
/// print(calculator.add(10, 5)); // 15
/// print(calculator.multiply(10, 5)); // 50
/// ```
class Calculator {
  /// Creates a new [Calculator].
  const Calculator();

  /// Adds [a] and [b] together.
  ///
  /// Returns the sum of the two numbers.
  ///
  /// Example:
  /// ```dart
  /// final result = calculator.add(10, 5);
  /// print(result); // 15
  /// ```
  double add(double a, double b) {
    return a + b;
  }

  /// Subtracts [b] from [a].
  ///
  /// Returns the difference between the two numbers.
  double subtract(double a, double b) {
    return a - b;
  }

  /// Multiplies [a] by [b].
  ///
  /// Returns the product of the two numbers.
  double multiply(double a, double b) {
    return a * b;
  }

  /// Divides [a] by [b].
  ///
  /// Returns the quotient.
  ///
  /// Throws [ArgumentError] if [b] is zero.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }

    return a / b;
  }
}

void main() {
  const calculator = Calculator();

  print(calculator.add(10, 5));
  print(calculator.subtract(10, 5));
  print(calculator.multiply(10, 5));
  print(calculator.divide(10, 5));
}