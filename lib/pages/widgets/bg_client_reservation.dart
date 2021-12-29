import 'package:flutter/material.dart';

class bgClientR extends StatelessWidget {
  const bgClientR({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/img/reserbg.jpg"),
          fit: BoxFit.cover
          )),
          padding: EdgeInsets.only(top:50.0),
          
          );


      
    
  }
}