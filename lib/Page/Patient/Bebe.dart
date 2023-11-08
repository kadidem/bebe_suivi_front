import 'package:flutter/material.dart';
class Bebe extends StatelessWidget { 
  const Bebe({Key? key}) : super(key: key); 
  
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      color: const Color(0xffC4DFCB), 
      child: Center( 
        child: Text( 
          "Page Number 1", 
          style: TextStyle( 
            color: Colors.green[900], 
            fontSize: 45, 
            fontWeight: FontWeight.w500, 
          ), 
        ), 
      ), 
    ); 
  } 
} 