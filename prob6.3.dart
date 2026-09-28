class Person {
  final String name;
  final int age;

  Person(this.name, this.age)
      : assert(age >= 0 && age <= 120);
}

void main() {
  final person = Person('Laziz', 20);

  print('Name: ${person.name}');
  print('Age: ${person.age}');
}