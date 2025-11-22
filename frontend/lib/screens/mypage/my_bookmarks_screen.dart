import 'package:flutter/material.dart';

class MyBookmarksScreen extends StatefulWidget{
  const MyBookmarksScreen({super.key});

  @override
  State<MyBookmarksScreen> createState() => _MyBookmarksScreenState();
}


class _MyBookmarksScreenState extends State<MyBookmarksScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MyBookMarksScreen"),
      ),
    );
  }
}
