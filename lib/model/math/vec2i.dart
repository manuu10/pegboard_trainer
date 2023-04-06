import 'dart:math';

class Vec2i {
  int x;
  int y;
  Vec2i(this.x, this.y);
  factory Vec2i.fromIndex(int index, int rowLength) {
    return Vec2i(index % rowLength, index ~/ rowLength);
  }
  static Vec2i get zero => Vec2i(0, 0);
  static Vec2i get max => Vec2i(9999999, 9999999);

  Vec2i copy() {
    return Vec2i(x, y);
  }

  int index(int rowLength) {
    return (y * rowLength) + x;
  }

  double length() {
    return sqrt(x * x + y * y);
  }

  double distanceTo(Vec2i other) {
    Vec2i distVector = this - other;
    return distVector.length();
  }

  Vec2i abs() {
    return Vec2i(x.abs(), y.abs());
  }

  Vec2i operator +(Vec2i other) {
    return Vec2i(x + other.x, y + other.y);
  }

  Vec2i operator -(Vec2i other) {
    return Vec2i(x - other.x, y - other.y);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Vec2i) return false;
    return x == other.x && y == other.y;
  }

  bool operator <(Vec2i other) {
    return (x <= other.x && y < other.y) || (x < other.x && y <= other.y);
  }

  bool operator >(Vec2i other) {
    return (x >= other.x && y > other.y) || (x > other.x && y >= other.y);
  }

  @override
  int get hashCode => Object.hash(x, y);
}
