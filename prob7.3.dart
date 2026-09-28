enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

String getDayDisplayName(Day day) {
  return switch (day) {
    Day.monday => 'Monday',
    Day.tuesday => 'Tuesday',
    Day.wednesday => 'Wednesday',
    Day.thursday => 'Thursday',
    Day.friday => 'Friday',
    Day.saturday => 'Saturday',
    Day.sunday => 'Sunday',
  };
}

void main() {
  print(getDayDisplayName(Day.monday));
  print(getDayDisplayName(Day.saturday));
}