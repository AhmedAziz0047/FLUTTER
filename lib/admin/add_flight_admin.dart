import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:http/http.dart' as http ;



class AddFlightAdmin extends StatelessWidget {
   AddFlightAdmin({ Key? key }) : super(key: key);

final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  final TextEditingController countryCT=TextEditingController();
  final TextEditingController allerCT=TextEditingController();
  final TextEditingController retourCT=TextEditingController();
  final TextEditingController prixCT=TextEditingController();
  final TextEditingController photoCT=TextEditingController();
  final TextEditingController seatsCT=TextEditingController();
  late http.Response status;



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text("Add flight"),
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
                  labelText: "Country"
                ),
                controller: countryCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a country";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Departure Date"
                ),
                controller: allerCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Departure Date";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "arrival Date"
                ),
                controller: retourCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter arrival Date";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "price"
                ),
                controller: prixCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the price";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Photo"
                ),
                controller: photoCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the number of seats";
                  }
                }
              ),
              const SizedBox(),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "photo"
                ),
                controller: seatsCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Number of seats";
                  }
                }
              ),
              const SizedBox(),
              TextButton(child: const Text("choose date"),
                   onPressed: () async {
                                final pickedDate = await showDateRangePicker(
                                  context: context,
                                  lastDate:
                                      DateTime.now().add(const Duration(days: 365)),
                                  firstDate: DateTime.now(),
                                );
                              
                                // CreateEventFinalValues.pickedTime = pickedDate;
                                allerCT.text=pickedDate!.start.toString().substring(0,pickedDate.start.toString().indexOf(" "));
                                retourCT.text=pickedDate.end.toString().substring(0,pickedDate.end.toString().indexOf(" "));
                                
                              },
                            
              
              
              
              ),

              const SizedBox(),
              TextButton(onPressed:()async{
                
                 await Flights_reservation_service().addFlight(context,countryCT.text, allerCT.text, retourCT.text, 
                                                     prixCT.text, photoCT.text, 
                                                     seatsCT.text);
                  
                
                MyToast().showtoast(status.statusCode == 201 ? "added successfuly" : "verif your data");
              },
              child:const Text('ADD'),
              ),
              
            ],
          ),
          ),
        )
    );
  }

}