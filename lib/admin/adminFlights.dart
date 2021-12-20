import 'package:flutter/material.dart';
class adminFlights extends StatefulWidget {
  const adminFlights({ Key? key }) : super(key: key);

  @override
  _adminFlightsState createState() => _adminFlightsState();
}

class _adminFlightsState extends State<adminFlights> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:_currentIndex,
              items: [
              BottomNavigationBarItem(
                icon: Icon(IconData(0xe06d, fontFamily: 'MaterialIcons')),
                label:'flights',
                backgroundColor: Colors.blue

              ), BottomNavigationBarItem(
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
              onTap: (index){
                setState(() {
                  _currentIndex=index;
                });
              },
            ),
    );
  }
}
