import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.allPadding,
    this.radius,
    this.color,
    this.offset,
    this.border,
    this.bgImage,
  });
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? allPadding;
  final double? radius;
  final Color? color;
  final Offset? offset;
  final Border? border;
  final String? bgImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.all(allPadding ?? 20.0),
      decoration: BoxDecoration(
        color: color ?? Colors.red[200],
        borderRadius: BorderRadius.circular(radius ?? 20.0),
        border: border,
        boxShadow: [
          BoxShadow(
            offset: offset ?? const Offset(3, 3),
          ),
        ],
        image: bgImage != null
            ? DecorationImage(
                image: NetworkImage(bgImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
