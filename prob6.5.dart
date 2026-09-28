class BankAccount {
  double _balance;

  BankAccount(double initialBalance) : _balance = initialBalance {
    if (initialBalance < 0) {
      throw ArgumentError('Initial balance cannot be negative.');
    }
  }

  // Custom getter
  double get balance {
    return _balance;
  }

  // Custom setter
  set balance(double newBalance) {
    if (newBalance < 0) {
      throw ArgumentError('Balance cannot be negative.');
    }

    _balance = newBalance;
  }
}

void main() {
  final account = BankAccount(100);

  print(account.balance); // 100

  account.balance = 250;
  print(account.balance); // 250

  // account.balance = -50; // ❌ ArgumentError
}