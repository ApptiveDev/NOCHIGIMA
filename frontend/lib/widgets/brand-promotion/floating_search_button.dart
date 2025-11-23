import 'package:flutter/material.dart';

// floatingSearchButton
class FloatingSearchButton extends StatelessWidget {
  const FloatingSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,

      child: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SearchPromotion()),
          // );
        },
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
