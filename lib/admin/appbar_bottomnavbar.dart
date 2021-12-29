import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_flight_admin.dart';
import 'package:flutterproject/admin/add_reservation_admin.dart';
import 'package:flutterproject/admin/add_user.dart';
import 'package:flutterproject/admin/adminFlights.dart';
import 'package:flutterproject/admin/adminReservations.dart';
import 'package:flutterproject/admin/adminUsers.dart';
class appbar_bottomnavbar extends StatefulWidget {
  const appbar_bottomnavbar({ Key? key }) : super(key: key);

  @override
  _bottomnavbarState createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<appbar_bottomnavbar> {
  List<String>pagesKeys=["flights","reservations","users","addFligh","addReserv","addUser"];
  int currentIndex=0;
  final screens=[adminFlights(),
                 adminReservations(),
                 adminUsers(),             
                 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[900],
          title: Text("Dashboard"),
      ),
      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[900],
              currentIndex:currentIndex,
              onTap: (index)=>setState(()=>currentIndex=index ),
              items: [
             
                BottomNavigationBarItem(
                icon: Icon(IconData(0xee5f, fontFamily: 'MaterialIcons')),
                label:'Flights',
                backgroundColor: Colors.green
              ), 
                BottomNavigationBarItem(
                icon: Icon(IconData(0xe06d, fontFamily: 'MaterialIcons')),
                label:'Reservations',
                backgroundColor: Colors.blue

              ),
               BottomNavigationBarItem(
                icon: Icon(IconData(0xe743, fontFamily: 'MaterialIcons')),
                label:'Users',
                backgroundColor: Colors.green
              ), 
              ],
            selectedItemColor: Colors.white,
            selectedFontSize: 15,
            
              
            ),
           
    );
  }
}