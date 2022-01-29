import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_shake_animated/src/shake_constant.dart';

class ShakeWidget extends StatefulWidget {
  /// animate widget
  final Widget child;
  /// shake_xxxx_constant
  final ShakeConstant shakeConstant;
  /// animate duration
  final Duration? duration;
  /// true: start false:stop, default is false
  final bool autoPlay;
  /// web onHover event
  final bool enableWebMouseHover;
  /// AnimationController can help if  want to control by yourself
  final Function(AnimationController controller)? onController;

  const ShakeWidget(
      {Key? key,
      required this.child,
      required this.shakeConstant,
      this.duration,
      this.autoPlay = false,
      this.enableWebMouseHover = true,
      this.onController
      })
      : super(key: key);

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _translateAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotateAnimation;

  int _tempEnterSecond = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? widget.shakeConstant.duration);

    // translate
    if (widget.shakeConstant.translate.isEmpty) {
      _translateAnimation = ConstantTween(Offset.zero).animate(_controller);
    } else if(widget.shakeConstant.translate.length == 1){
      _translateAnimation = ConstantTween(widget.shakeConstant.translate.first).animate(_controller);
    }else{
      _translateAnimation = TweenSequence(
        List.generate(widget.shakeConstant.translate.length - 1, (index) {
          final beginOffset = widget.shakeConstant.translate[index];
          final endOffset = widget.shakeConstant.translate[index + 1];
          double weight = 0;
          if (widget.shakeConstant.interval.length == 1) {
            weight = widget.shakeConstant.interval.first * 1.0;
          } else if (widget.shakeConstant.interval.length > 1 &&
              widget.shakeConstant.interval.length ==
                  widget.shakeConstant.translate.length) {
            final beginWeight = widget.shakeConstant.interval[index];
            final endWeight = widget.shakeConstant.interval[index + 1];
            weight = (endWeight - beginWeight) * 1.0;
          } else {
            weight =
                100 / math.max((widget.shakeConstant.translate.length - 1), 1);
          }
          return TweenSequenceItem(
              tween: Tween(begin: beginOffset, end: endOffset), weight: weight);
        }),
      ).animate(_controller);
    }
    // opacity
    if (widget.shakeConstant.opacity.isEmpty) {
      _opacityAnimation = ConstantTween(1.0).animate(_controller);
    } else if (widget.shakeConstant.opacity.length == 1) {
      _opacityAnimation = ConstantTween(widget.shakeConstant.opacity.first)
          .animate(_controller);
    } else {
      _opacityAnimation = TweenSequence(
        List.generate(widget.shakeConstant.opacity.length - 1, (index) {
          final beginOpacity = widget.shakeConstant.opacity[index];
          final endOpacity = widget.shakeConstant.opacity[index + 1];

          double weight = 0;
          if (widget.shakeConstant.interval.length == 1) {
            weight = widget.shakeConstant.interval.first * 1.0;
          } else if (widget.shakeConstant.interval.length > 1 &&
              widget.shakeConstant.interval.length ==
                  widget.shakeConstant.opacity.length) {
            final beginWeight = widget.shakeConstant.interval[index];
            final endWeight = widget.shakeConstant.interval[index + 1];
            weight = (endWeight - beginWeight) * 1.0;
          } else {
            weight =
                100 / math.max((widget.shakeConstant.translate.length - 1), 1);
          }
          return TweenSequenceItem(
              tween: Tween(begin: beginOpacity, end: endOpacity),
              weight: weight);
        }),
      ).animate(_controller);
    }

    // rotate
    if (widget.shakeConstant.rotate.isEmpty) {
      _rotateAnimation = ConstantTween(0.0).animate(_controller);
    } else if (widget.shakeConstant.rotate.length == 1) {
      _rotateAnimation = ConstantTween(widget.shakeConstant.rotate.first * 1.0)
          .animate(_controller);
    } else {
      _rotateAnimation = TweenSequence(
        List.generate(widget.shakeConstant.rotate.length - 1, (index) {
          final beginRotate = widget.shakeConstant.rotate[index];
          final endRotate = widget.shakeConstant.rotate[index + 1];
          double weight = 0;
          if (widget.shakeConstant.interval.length == 1) {
            weight = widget.shakeConstant.interval.first * 1.0;
          } else if (widget.shakeConstant.interval.length > 1 &&
              widget.shakeConstant.interval.length ==
                  widget.shakeConstant.rotate.length) {
            final beginWeight = widget.shakeConstant.interval[index];
            final endWeight = widget.shakeConstant.interval[index + 1];
            weight = (endWeight - beginWeight) * 1.0;
          } else {
            weight =
                100 / math.max((widget.shakeConstant.translate.length - 1), 1);
          }
          return TweenSequenceItem(
              tween: Tween(
                  begin: math.pi / 180 * beginRotate,
                  end: math.pi / 180 * endRotate),
              weight: weight);
        }),
      ).animate(_controller);
    }

    if (widget.autoPlay) {
      _controller.repeat(reverse: true);
    }

    widget.onController?.call(_controller);
  }

  @override
  void didUpdateWidget(covariant ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.autoPlay != widget.autoPlay) {
      if (widget.autoPlay) {
        _controller.repeat();
      } else {
        _controller.reset();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(
                _translateAnimation.value.dx, _translateAnimation.value.dy)
            ..rotateZ(_rotateAnimation.value),
          child: Opacity(opacity: _opacityAnimation.value, child: child),
        );
      },
      child: widget.autoPlay || widget.enableWebMouseHover == false
          ? widget.child
          : MouseRegion(
              onEnter: (PointerEnterEvent event) {
                if(event.timeStamp.inMicroseconds != _tempEnterSecond){
                  _controller.repeat(reverse: true);
                  _tempEnterSecond = event.timeStamp.inMicroseconds;
                }
              },
              onExit: (PointerExitEvent event) {
                if(event.timeStamp.inMicroseconds != _tempEnterSecond) {
                  _controller.reset();
                }
              },
              child: widget.child,
            ),
    );
  }
}
