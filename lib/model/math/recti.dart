import 'package:pegboard_trainer/model/math/vec2i.dart';

class RectI {
  Vec2i topLeft;
  Vec2i bottomRight;

  RectI(this.topLeft, this.bottomRight);

  static RectI get zero => RectI(Vec2i.zero, Vec2i.zero);
  static RectI get maxed => RectI(Vec2i.zero, Vec2i.max);
  int get width => bottomRight.x - topLeft.x;
  int get height => topLeft.y - bottomRight.y;

  RectI copy() {
    return RectI(topLeft.copy(), bottomRight.copy());
  }

  // factory RectI.fromCenter(Vec2i center, int hWidth,int hHeight){

  // }
  // factory RectI.fromXYWH(int x, int y, int w, int h){
  //
  // }
}
