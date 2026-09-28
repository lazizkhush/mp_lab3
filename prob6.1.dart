class Point {
  final double x;
  final double y;

  // Default/unnamed constructor
  const Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = 0,
        y = 0;

  // Factory constructor
  factory Point.fromJson(Map<String, double> json) {
    return Point(
      json['x'] ?? 0,
      json['y'] ?? 0,
    );
  }
}

void main() {
  // Default constructor
  const point1 = Point(10, 20);

  // Named constructor
  final point2 = Point.origin();

  // Factory constructor
  final point3 = Point.fromJson({
    'x': 5,
    'y': 15,
  });

  print('${point1.x}, ${point1.y}');
  print('${point2.x}, ${point2.y}');
  print('${point3.x}, ${point3.y}');
}