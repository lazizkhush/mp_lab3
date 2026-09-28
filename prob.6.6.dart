/// Represents user data transferred between parts of an application.
///
/// This class is immutable, meaning its fields cannot be changed after
/// the object has been created.
class UserDto {
  final String name;
  final int age;
  final String email;

  /// Creates an immutable [UserDto].
  const UserDto({
    required this.name,
    required this.age,
    required this.email,
  });
}

void main() {
  const user = UserDto(
    name: 'Laziz',
    age: 20,
    email: 'laziz@example.com',
  );

  print(user.name);
  print(user.age);
  print(user.email);

  // user.age = 21; // ❌ Error: age is final
}