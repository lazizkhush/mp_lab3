/// A utility class for validating user data.
class DataValidator {
  /// **Validates a username.**
  ///
  /// Requirements:
  /// - Must not be empty
  /// - Must contain at least 3 characters
  /// - Must contain only letters and numbers
  ///
  /// Example:
  /// ```dart
  /// final result = DataValidator.isValidUsername('laziz123');
  /// print(result); // true
  /// ```
  ///
  /// Returns `true` if the username is valid.
  ///
  /// Throws [ArgumentError] if [username] is empty.
  static bool isValidUsername(String username) {
    if (username.isEmpty) {
      throw ArgumentError('Username cannot be empty');
    }

    return username.length >= 3 &&
        RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
  }
}

void main() {
  print(DataValidator.isValidUsername('laziz123'));
}