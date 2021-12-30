import 'package:flutter/material.dart';

class BgClientR extends StatelessWidget {
  const BgClientR({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/img/reserbg.jpg"),
          fit: BoxFit.cover
          )),
          padding: const EdgeInsets.only(top:50.0),
          
          );


      
    
  }
}