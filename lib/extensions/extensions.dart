import 'dart:math' as math;

extension ToRad on num {
  double toRad() => this * math.pi / 180.0;
}

extension ToDeg on double {
  num toDeg() => this * 180.0 / math.pi;
}
