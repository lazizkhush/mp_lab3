// Listing 12: Exceptions & Error Handling

// ============================================================
// Problem 1: Custom Exception + try-on-catch-finally
// ============================================================

class InsufficientFundsException implements Exception {
  final double required;

  InsufficientFundsException(this.required);

  @override
  String toString() =>
      'InsufficientFundsException: Missing \$$required';
}

void withdraw(double amount, double balance) {
  if (amount > balance) {
    throw InsufficientFundsException(amount - balance);
  }

  print('Withdrawal successful: \$$amount');
}

// ============================================================
// Problem 2: Division + UnsupportedError
// ============================================================

double divide(double a, double b) {
  if (b == 0) {
    throw UnsupportedError('Cannot divide by zero.');
  }

  return a / b;
}

// ============================================================
// Problem 3: ArgumentError for Empty or Null String
// ============================================================

void validateName(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('Name cannot be empty or null.');
  }

  print('Valid name: $name');
}

// ============================================================
// Problem 4: Handle Specific and Generic Exceptions
// ============================================================

void processValue(String value) {
  try {
    final number = int.parse(value);

    if (number < 0) {
      throw StateError('Number cannot be negative.');
    }

    print('Valid number: $number');
  } on FormatException catch (e) {
    print('FormatException: Invalid number format.');
    print('Details: $e');
  } on StateError catch (e) {
    print('StateError: $e');
  } catch (e) {
    print('Unknown exception: $e');
  }
}

// ============================================================
// Problem 5: Capture Full Stack Trace
// ============================================================

void riskyOperation() {
  throw Exception('Something went wrong!');
}

void debugOperation() {
  try {
    riskyOperation();
  } catch (e, stackTrace) {
    print('Exception: $e');
    print('Full stack trace:');
    print(stackTrace);
  }
}

// ============================================================
// Main
// ============================================================

void main() {
  // ----------------------------------------------------------
  // Problem 1
  // ----------------------------------------------------------

  print('--- Problem 1 ---');

  try {
    withdraw(150, 100);
  } on InsufficientFundsException catch (e, stackTrace) {
    print('Caught custom exception: $e');
    print('Stack trace: $stackTrace');
  } finally {
    print('Transaction complete.');
  }

  // ----------------------------------------------------------
  // Problem 2
  // ----------------------------------------------------------

  print('\n--- Problem 2 ---');

  try {
    final result = divide(10, 0);
    print('Result: $result');
  } on UnsupportedError catch (e) {
    print('Caught UnsupportedError: $e');
  }

  // Normal division
  try {
    final result = divide(10, 2);
    print('10 / 2 = $result');
  } on UnsupportedError catch (e) {
    print('Caught UnsupportedError: $e');
  }

  // ----------------------------------------------------------
  // Problem 3
  // ----------------------------------------------------------

  print('\n--- Problem 3 ---');

  try {
    validateName('');
  } on ArgumentError catch (e) {
    print('Caught ArgumentError: $e');
  }

  try {
    validateName(null);
  } on ArgumentError catch (e) {
    print('Caught ArgumentError: $e');
  }

  validateName('Laziz');

  // ----------------------------------------------------------
  // Problem 4
  // ----------------------------------------------------------

  print('\n--- Problem 4 ---');

  processValue('123');
  processValue('hello');
  processValue('-10');

  // ----------------------------------------------------------
  // Problem 5
  // ----------------------------------------------------------

  print('\n--- Problem 5 ---');

  debugOperation();
}