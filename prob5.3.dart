/// A utility class for validating user data.
class DataValidator {
  /// Validates whether [email] has a valid email format.
  ///
  /// [email] is the email address to validate.
  ///
  /// Returns `true` if the email is valid, otherwise `false`.
  ///
  /// Throws [ArgumentError] if [email] is empty.
  static bool isValidEmail(String email) {
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }

    return email.contains('@');
  }

  /// Validates whether [age] is within the allowed range.
  ///
  /// [age] is the user's age.
  ///
  /// Returns `true` if the age is between 18 and 100.
  ///
  /// Throws [ArgumentError] if [age] is negative.
  static bool isValidAge(int age) {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }

    return age >= 18 && age <= 100;
  }
}