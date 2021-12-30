import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddReservationAdmin extends StatelessWidget {
  AddReservationAdmin({ Key? key }) : super(key: key);

   Future addReservationAPI(String name,String lastN,String country,String email)async{
      var url='http://192.168.1.16:3000/api/addReservations';
      final res= await http.post(Uri.parse(url),body: {
       'country':country,
        'nomclient':lastN,
        'prenomclient':name,
        'email':email
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
          title: const Text("Add new reservation"),
      ),
        body: Container(padding: const EdgeInsets.only(left:40,right:40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Passenger Name"
                ),
                controller: nameCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a country";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Passenger Last Name"
                ),
                controller: last,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Departure Date";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Country"
                ),
                controller: country,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter arrival Date";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                controller: email,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the price";
                  }
                }
              ),
              
              const SizedBox(),
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