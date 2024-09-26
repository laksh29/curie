import 'dart:developer';

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.ctaText = "",
    this.child,
    this.padding,
    this.allPadding,
    this.radius,
    this.color,
    this.border,
    this.bgImage,
  });

  final String ctaText;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? allPadding;
  final double? radius;
  final Color? color;
  final Border? border;
  final String? bgImage;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool isButtonTapped = false;
  final int durationMill = 100;

  late AnimationController controller;

  late Animation<double> depthAnimation;
  late Animation<double> shadowAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationMill),
      reverseDuration: Duration(milliseconds: durationMill),
    );

    depthAnimation = Tween<double>(begin: 0, end: 3).animate(controller);
    shadowAnimation = Tween<double>(begin: 3, end: 0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        log("value : ${controller.value}");
        final double depth = depthAnimation.value;
        final double shadow = shadowAnimation.value;

        return Transform.translate(
          offset: Offset(depth, depth),
          child: GestureDetector(
            onTapDown: (_) {
              log("on tap down");
              controller.forward();
            },
            onTapUp: (_) {
              log("on tap up");
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward().whenComplete(() => controller.reverse());
              }
            },
            child: Container(
              padding:
                  widget.padding ?? EdgeInsets.all(widget.allPadding ?? 20.0),
              decoration: BoxDecoration(
                  color: widget.color ?? Colors.green,
                  borderRadius: BorderRadius.circular(
                    widget.radius ?? 15.0,
                  ),
                  border: widget.border ??
                      Border.all(color: Colors.black, width: 1),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(shadow, shadow),
                    ),
                  ],
                  image: widget.bgImage == null
                      ? null
                      : DecorationImage(
                          image: NetworkImage(widget.bgImage!),
                          fit: BoxFit.cover,
                        )),
              child: widget.child ?? Text(widget.ctaText),
            ),
          ),
        );
      },
    );
  }
}
