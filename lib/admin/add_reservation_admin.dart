import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';


class AddReservationAdmin extends StatelessWidget {
  AddReservationAdmin({ Key? key }) : super(key: key);


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
                
                final  reser=await Flights_reservation_service().addReservationAPI(context,nameCT.text,last.text,country.text,email.text);
                
                
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