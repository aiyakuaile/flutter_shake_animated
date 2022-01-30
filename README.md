# flutter_shake_animated
[![Pub](https://img.shields.io/pub/v/flutter_shake_animated.svg?style=flat-square)](https://github.com/aiyakuaile/flutter_shake_animated)
[![support](https://img.shields.io/badge/platform-flutter%7Cflutter%20web%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/aiyakuaile/flutter_shake_animated)


## Get started

![shake animated](https://raw.githubusercontent.com/aiyakuaile/flutter_shake_animated/main/shake.gif)

this shake effect I refer to this css open source library, ***[CSShake](https://elrumordelaluz.github.io/csshake/)***

### Add dependency

```yaml
dependencies:
  flutter_shake_animated: ^0.0.5
```

## Usage

For more animate effects, please refer to ***example/lib/main.dart*** file

```
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

ShakeWidget(
    duration: duration,
    shakeConstant: shakeConstant,
    autoPlay: true,
    enableWebMouseHover: true,
    child: your widget,
)
```

## ShakeConstant
    1. ShakeDefaultConstant1,ShakeDefaultConstant2
    2. ShakeHardConstant1,ShakeHardConstant2
    3. ShakeSlowConstant1,ShakeSlowConstant2
    4. ShakeLittleConstant1,ShakeLittleConstant2
    5. ShakeHorizontalConstant1,ShakeHorizontalConstant2
    6. ShakeVerticalConstant1,ShakeVerticalConstant2
    7. ShakeRotateConstant1,ShakeRotateConstant2
    8. ShakeCrazyConstant1,ShakeCrazyConstant2
    9. ShakeOpacityConstant
    10.ShakeChunkConstant


## Custom shake animation

```dart

class CustomShakeAnimated implements ShakeConstant {

  @override
  Duration get duration => throw UnimplementedError();

  @override
  /// range: 0 - 100 && incremental, last value must equal 100. 
  /// when only have oneelement,represents the same interval
  List<int> get interval => throw UnimplementedError();

  @override
  /// range: 0 - 1.0, []:1.0 = [1.0]
  List<double> get opacity => throw UnimplementedError();

  @override
  /// eg: 45deg = pi / 4, []:0 = [45]: rotate 45deg
  List<double> get rotate => throw UnimplementedError();

  @override
  // Offset(double dx, double dy)
  List<Offset> get translate => throw UnimplementedError();
  
}

```




