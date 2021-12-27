import 'package:flutter/material.dart';
class addFlight extends StatefulWidget {
  const addFlight({ Key? key }) : super(key: key);

  @override
  _addFlightState createState() => _addFlightState();
}

class _addFlightState extends State<addFlight> {
  String _country="";
  String  _date_aller="";
  String _date_retour="";
  int _prix=0;
  String _photo="";
  int _Remaining_Seats=0;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD A TRIP'),
      
      ),
        body: Container(padding: const EdgeInsets.only(left:40,right:40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Country"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a country";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Departure Date"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Departure Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "arrival Date"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter arrival Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "price"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the price";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "number of seats"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the number of seats";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "photo"
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a photo";
                  }
                }
              ),
              SizedBox(),
              OutlineButton(onPressed:(){},
              child:Text('ADD')
              ),
              
            ],
          ),
          ),
        )
    );
  }
}