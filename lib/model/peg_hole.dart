// ignore_for_file: public_member_api_docs, sort_constructors_first

class Vec2i {
  final int x;
  final int y;
  Vec2i(this.x, this.y);
  factory Vec2i.fromIndex(int index, int rowLength) {
    return Vec2i(index % rowLength, index ~/ rowLength);
  }
  int index(int rowLength) {
    return (y * rowLength) + x;
  }

  @override
  bool operator ==(Object other) {
    if (other is! Vec2i) return false;
    return x == other.x && y == other.y;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

class PegHole {
  final Vec2i position;
  PegHole({
    required this.position,
  });
}
