import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class addReservationAdmin extends StatefulWidget {
  const addReservationAdmin({ Key? key }) : super(key: key);

  @override
  _addReservationAdminState createState() => _addReservationAdminState();

}

class _addReservationAdminState extends State<addReservationAdmin> {
    Future addReservationAPI(String Name,String LastN,String Country,String Email)async{
      var url='http://192.168.1.16:3000/api/addReservations';
      final res= await http.post(Uri.parse(url),body: {
       'country':Country,
        'nomclient':LastN,
        'prenomclient':Name,
        'email':Email
      });
      print(res.statusCode);
      return json.decode(res.body);
}
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
   final TextEditingController country=TextEditingController();
  final TextEditingController nameCT=TextEditingController();
  final TextEditingController last=TextEditingController();
  final TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[500],
          title: Text("Add new reservation"),
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
                  labelText: "Passenger Name"
                ),
                controller: nameCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a country";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Passenger Last Name"
                ),
                controller: last,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Departure Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Country"
                ),
                controller: country,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter arrival Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                controller: email,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the price";
                  }
                }
              ),
              
              SizedBox(),
              OutlineButton(onPressed:()async{
                
                final  reser=await addReservationAPI(nameCT.text,last.text,country.text,email.text);
                
                
              },
              child:Text('ADD')
              ),
              
            ],
          ),
          ),
        )
    );
  }
}