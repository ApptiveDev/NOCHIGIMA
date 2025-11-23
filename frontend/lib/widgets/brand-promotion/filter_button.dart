import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  const FilterButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: borderColor ?? Color(0xFF323439), width: 1.0),
        ),
        minimumSize: Size.zero,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 15.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: child,
    );
  }
}