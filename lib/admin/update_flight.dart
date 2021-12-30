import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';

class UpdateFlight extends StatelessWidget {
 UpdateFlight({ Key? key,required this.id }) : super(key: key);
  final String id;



final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update flight"),),
      body: Container(padding: const EdgeInsets.only(left:40,right:40),
      child:
      FutureBuilder<Map>(
        future: Flights_reservation_service().getOneFlight(id),
        builder: (context,snapshot){
                 if(snapshot.hasError){
                  return Center(child: 
                        Text(snapshot.error.toString()),
                  );
                }
                 
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                    );
                }
               if (!snapshot.hasData){
                  return const Text("no data");
                }
                var data=snapshot.data;
                final TextEditingController countryCT=TextEditingController(text: data!['country']);
                final TextEditingController allerCT=TextEditingController(text: data['date_aller'] );
                final TextEditingController retourCT=TextEditingController(text: data['date_retour']);
                final TextEditingController prixCT=TextEditingController(text: data['prix']);
                final TextEditingController photoCT=TextEditingController(text: data['photo']);
                final TextEditingController seatsCT=TextEditingController(text: data['Remaining_Seats']);
                
                
         return Form(
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Country',
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
                  labelText:  'Departure date',
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
                  labelText: 'Arrival date'
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
                  labelText: 'Price'
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
                  labelText: 'Photo'
                ),
                controller: photoCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the photo";
                  }
                }
              ),
              const SizedBox(),
              
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Number of seats'
                ),
                controller: seatsCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Number of seats";
                  }
                }
              ),
              const SizedBox(),
              TextButton(child:const  Text("choose date"),
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
                
                 await Flights_reservation_service().updateFlight(countryCT.text, allerCT.text, retourCT.text, 
                                                     prixCT.text, photoCT.text, seatsCT.text,id);
                  
                
                // MyToast().showtoast(status.statusCode == 201 ? "added successfuly" : "verif your data");
              },
              child:const Text('Update'),
              ),
            ],
          ),
         );
        },
      )
      
    ),);
  }

  void setState(Null Function() param0) {}
}