import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';

class UpdateReserv extends StatelessWidget {
  UpdateReserv({ Key? key,required this.id}) : super(key: key);
  final String id;
   final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
   final TextEditingController country=TextEditingController();
  final TextEditingController nameCT=TextEditingController();
  final TextEditingController last=TextEditingController();
  final TextEditingController email=TextEditingController();

  


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: const Text("Update reservation"),),
      body: Container(padding: const EdgeInsets.only(left:40,right:40),
      child:
      FutureBuilder<Map>(
        future: Flights_reservation_service().getOneReserv(id),
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
                final TextEditingController name=TextEditingController(text: data['prenomclient'] );
                final TextEditingController lname=TextEditingController(text: data['nomclient']);
                final TextEditingController email=TextEditingController(text: data['email']);

                
                
         return Form(
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Passenger name',
                ),
                controller: name,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a name";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText:  'Passenger Last Name',
                ),
                controller: lname,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter last name";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                
                decoration: const InputDecoration(
                  labelText: 'Destination'
                ),
                controller: countryCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Destination";
                  }
                }
              ),
              const SizedBox(),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email'
                ),
                controller: email,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the Email";
                  }
                }
              ),
           
           
          
              const SizedBox(),
              TextButton(onPressed:()async{
                
                 await Flights_reservation_service().updateReservadmin(context,countryCT.text, name.text, lname.text, 
                                                      email.text,id);
                  
                
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
}