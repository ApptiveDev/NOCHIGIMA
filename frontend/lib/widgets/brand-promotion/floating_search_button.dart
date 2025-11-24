import 'package:flutter/material.dart';

// floatingSearchButton
class FloatingSearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingSearchButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,

      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.search, color: Colors.grey[600], size: 35),
        shape: CircleBorder(
          side: BorderSide(color: Colors.grey[200]!, width: 1.0),
        ),
        elevation: 4.5,
        backgroundColor: Colors.white,
      ),
    );
  }
}
