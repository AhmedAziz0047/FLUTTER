import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        backgroundColor: Colors.grey,
        body:SingleChildScrollView(child:Wrap(children: List<Widget>.generate(5, (index) {return volsitem();}))),
      )
      
    );
  }
}