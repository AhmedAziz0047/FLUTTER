import 'package:flutter/material.dart';
import 'package:flutterproject/admin/adminFlights.dart';
import 'package:flutterproject/admin/bottomnavbar.dart';
import 'package:flutterproject/widgets/vols_item.dart';

class HomeScreen extends StatefulWidget {
  int data;
  HomeScreen({ Key? key, required this.data}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(  
      child:Scaffold(
        appBar: AppBar(
          title:Text("Our Trips"),
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.white,
        body:bottomnavbar()
        // SingleChildScrollView(child:Wrap(children: List<Widget>.generate(5, (index) {return adminFlights();}))),
      )
      // body: Container(
      //     decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngnXL9xDDjxMzGZO9CWXhKpioEu0nxpZJww&usqp=CAU"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: null /* add child content here */,
      //   ),
      
    );
  }
}