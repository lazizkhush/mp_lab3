/// Represents a user in the application.
class User {
  /// The user's name.
  final String name;

  /// Creates a [User] with the given [name].
  User(this.name);

  /// Returns a greeting for the user.
  String greet() {
    return 'Hello, $name!';
  }

  /// Returns the user's display name.
  ///
  /// This method is kept for compatibility with older code.
  @deprecated
  String get username {
    return name;
  }
}

/// Represents an administrator.
class Admin extends User {
  /// Creates an [Admin] with the given [name].
  Admin(super.name);

  /// Returns a special greeting for the administrator.
  ///
  /// This overrides [User.greet].
  @override
  String greet() {
    return 'Hello, Admin $name!';
  }
}

void main() {
  final admin = Admin('Laziz');

  print(admin.greet());
  print(admin.username); // Deprecated
}