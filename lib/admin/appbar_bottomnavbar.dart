import 'package:flutter/material.dart';
import 'package:flutterproject/admin/admin_users.dart';

import 'admin_flights.dart';
import 'admin_reservations.dart';
class AppbarBottomnavbar extends StatefulWidget {
  const AppbarBottomnavbar({ Key? key }) : super(key: key);

  @override
  _AppbarBottomnavbarState createState() => _AppbarBottomnavbarState();
}

class _AppbarBottomnavbarState extends State<AppbarBottomnavbar> {
  List<String>pagesKeys=["flights","reservations","users"];
  int currentIndex=0;
  final screens=[const AdminFlights(),
                 const AdminReservations(),
                 const AdminUsers(),             
                 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[900],
          title:const Text("Dashboard"),
      ),
      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[900],
              currentIndex:currentIndex,
              onTap: (index)=>setState(()=>currentIndex=index ),
              items: const[
             
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