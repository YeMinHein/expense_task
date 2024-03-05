import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonName;
  final double height;
  final double width;
  final double radius;
  final Color colors;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.height,
    required this.width,
    required this.radius,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: colors, borderRadius: BorderRadius.circular(radius)),
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Text(buttonName),
        ),
      ),
    );
  }
}
