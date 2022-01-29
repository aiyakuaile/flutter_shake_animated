import 'package:flutter/widgets.dart';
import 'shake_constant.dart';

class ShakeChunkConstant implements ShakeConstant {
  @override
  List<int> get interval => [
        0,
        2,
        4,
        6,
        8,
        10,
        12,
        14,
        16,
        18,
        20,
        22,
        24,
        26,
        28,
        30,
        32,
        34,
        36,
        38,
        40,
        100
      ];

  @override
  List<double> get opacity => const [];

  @override
  List<double> get rotate => const [
        0,
        -8,
        -14,
        -13,
        13,
        13,
        4,
        3,
        14,
        -3,
        -7,
        -7,
        -5,
        -12,
        -2,
        -4,
        -2,
        8,
        6,
        8,
        0,
        0
      ];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),
        Offset(-12, -13),
        Offset(9, -1),
        Offset(3, -8),
        Offset(14, 13),
        Offset(6, 3),
        Offset(-11, -6),
        Offset(-10, -5),
        Offset(10, 10),
        Offset(-3, 12),
        Offset(12, -1),
        Offset(6, -7),
        Offset(4, -4),
        Offset(-14, 7),
        Offset(-3, 5),
        Offset(-3, 8),
        Offset(-13, -7),
        Offset(-14, 1),
        Offset(0, 10),
        Offset(-9, -1),
        Offset(0, 0),
        Offset(0, 0)
      ];

  @override
  Duration get duration => const Duration(milliseconds: 4000);
}
