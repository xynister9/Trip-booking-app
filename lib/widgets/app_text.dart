
// import 'dart:ffi';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size ;
  final String text ;
  final Color color;
  final bool bold ;
  const AppText({Key? key,
    this.size=16,
    required this.text,
    this.bold = false ,
    this.color = Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: (bold ? FontWeight.bold : FontWeight.normal ),
      ),
    );
  }
}