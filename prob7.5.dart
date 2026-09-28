enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

Day? parseDay(String value) {
  try {
    return Day.values.byName(value.toLowerCase());
  } on ArgumentError {
    return null;
  }
}

void main() {
  final day1 = parseDay('monday');
  final day2 = parseDay('friday');
  final day3 = parseDay('invalid');

  print(day1); // Day.monday
  print(day2); // Day.friday
  print(day3); // null
}