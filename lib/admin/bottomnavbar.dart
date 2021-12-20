import 'package:flutter/material.dart';
import 'package:flutterproject/admin/adminFlights.dart';
import 'package:flutterproject/admin/adminReservations.dart';
import 'package:flutterproject/admin/adminUsers.dart';
class bottomnavbar extends StatefulWidget {
  const bottomnavbar({ Key? key }) : super(key: key);

  @override
  _bottomnavbarState createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  List<String>pagesKeys=["flights","reservations","users"];
  int currentIndex=1;
  final screens=[adminFlights(),
                 adminReservations(),
                 adminUsers()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
              currentIndex:currentIndex,
              onTap: (index)=>setState(()=>currentIndex=index ),
              items: [
              BottomNavigationBarItem(
                icon: Icon(IconData(0xe06d, fontFamily: 'MaterialIcons')),
                label:'flights',
                backgroundColor: Colors.blue

              ), 
                BottomNavigationBarItem(
                icon: Icon(IconData(0xee5f, fontFamily: 'MaterialIcons')),
                label:'Reservations',
                backgroundColor: Colors.green

              ),
               BottomNavigationBarItem(
                icon: Icon(IconData(0xe743, fontFamily: 'MaterialIcons')),
                label:'users',
                backgroundColor: Colors.orange
              )
              
            ],
            selectedItemColor: Colors.white,
            selectedFontSize: 15,
            
              
            ),
    );
  }
}