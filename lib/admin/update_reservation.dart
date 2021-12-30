import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateReserv extends StatelessWidget {
  UpdateReserv({ Key? key,required this.id}) : super(key: key);
  String id;
   final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
   final TextEditingController country=TextEditingController();
  final TextEditingController nameCT=TextEditingController();
  final TextEditingController last=TextEditingController();
  final TextEditingController email=TextEditingController();

  Future<Map> getOneReserv(String id)async{
  final deleteurl=(Uri.parse('http://192.168.1.16:3000/api/getReservbyid/$id'));
  final response =await http.get(deleteurl);
  print(response.statusCode);
  print(response.body);
  return json.decode(response.body);
  }
Future updateReserv(String country,String nameP,String lastP,String emailP)async{
  final url=Uri.parse('http://192.168.1.16:3000/api/editReservations/$id');
  final res=await http.put(url,
  body: {'country':country,
        'nomclient':nameP,
        'prenomclient':lastP,
        'email':emailP
      });
      print (res.statusCode);
      return json.decode(res.body);

}

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text("Update flight"),),
      body: Container(padding: const EdgeInsets.only(left:40,right:40),
      child:
      FutureBuilder<Map>(
        future: getOneReserv(id),
        builder: (context,snapshot){
                 if(snapshot.hasError){
                  return Center(child: 
                        Text(snapshot.error.toString()),
                  );
                }
                 
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                    );
                }
               if (!snapshot.hasData){
                  return Text("no data");
                }
                var data=snapshot.data;
                final TextEditingController countryCT=TextEditingController(text: data!['country']);
                final TextEditingController name=TextEditingController(text: data!['prenomclient'] );
                final TextEditingController Lname=TextEditingController(text: data!['nomclient']);
                final TextEditingController email=TextEditingController(text: data!['email']);

                
                
         return Form(
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Passenger name',
                ),
                controller: name,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a name";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText:  'Passenger Last Name',
                ),
                controller: Lname,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter last name";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                
                decoration: InputDecoration(
                  labelText: 'Destination'
                ),
                controller: countryCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Destination";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                controller: email,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the Email";
                  }
                }
              ),
           
           
          
              SizedBox(),
              TextButton(onPressed:()async{
                
                 await updateReserv(countryCT.text, name.text, Lname.text, 
                                                      email.text);
                  
                
                // MyToast().showtoast(status.statusCode == 201 ? "added successfuly" : "verif your data");
              },
              child:Text('Update'),
              ),
            ],
          ),
         );
        },
      )
      
    ),);
    
  }
}