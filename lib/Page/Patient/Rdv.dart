// ignore: file_names
import 'package:flutter/material.dart';
class Rdv extends StatelessWidget { 
  const Rdv({Key? key}) : super(key: key); 
  
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      color: const Color(0xffC4DFCB), 
      child: Center( 
        child: Text( 
          "Page Number 5", 
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