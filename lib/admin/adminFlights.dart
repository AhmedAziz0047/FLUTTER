import 'package:flutter/material.dart';
import 'package:flutterproject/admin/adminReservations.dart';
import 'package:flutterproject/admin/adminUsers.dart';
class adminFlights extends StatefulWidget {
  const adminFlights({ Key? key }) : super(key: key);

  @override
  _adminFlightsState createState() => _adminFlightsState();
}

class _adminFlightsState extends State<adminFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Text("flights works"),
    );
  }
}
