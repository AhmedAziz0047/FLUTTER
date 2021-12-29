import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateFlight extends StatelessWidget {
 UpdateFlight({ Key? key,required this.id }) : super(key: key);
  String id;
  Future<Map> getOneFlight(String id)async{
  final deleteurl=(Uri.parse('http://192.168.1.16:3000/api/getFlightbyid/$id'));
  final response =await http.get(deleteurl);
  print(response.statusCode);
  print(response.body);
  return json.decode(response.body);
}
Future updateFlight(String country,String dateAller,String dateRetour,String prix,String photo ,String RemainingSeats)async{
  final url=Uri.parse('http://192.168.1.16:3000/api/editFlight/$id');
  final res=await http.put(url,
  body: {'country':country,
        'date_aller':dateAller,
        'date_retour':dateRetour,
        'prix':prix,
        'photo':photo,
        'Remaining_Seats':RemainingSeats
      });
      print (res.statusCode);
      return json.decode(res.body);

}


final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update flight"),),
      body: Container(padding: const EdgeInsets.only(left:40,right:40),
      child:
      FutureBuilder<Map>(
        future: getOneFlight(id),
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
                final TextEditingController allerCT=TextEditingController(text: data!['date_aller'] );
                final TextEditingController retourCT=TextEditingController(text: data!['date_retour']);
                final TextEditingController PrixCT=TextEditingController(text: data!['prix']);
                final TextEditingController photoCT=TextEditingController(text: data!['photo']);
                final TextEditingController seatsCT=TextEditingController(text: data!['Remaining_Seats']);
                
                
         return Form(
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Country',
                ),
                controller: countryCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a country";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText:  'Departure date',
                ),
                controller: allerCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Departure Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                
                decoration: InputDecoration(
                  labelText: 'Arrival date'
                ),
                controller: retourCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter arrival Date";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price'
                ),
                controller: PrixCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the price";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Photo'
                ),
                controller: photoCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter the photo";
                  }
                }
              ),
              SizedBox(),
              
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Number of seats'
                ),
                controller: seatsCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Number of seats";
                  }
                }
              ),
              SizedBox(),
              TextButton(child: Text("choose date"),
                   onPressed: () async {
                                final pickedDate = await showDateRangePicker(
                                  context: context,
                                  lastDate:
                                      DateTime.now().add(Duration(days: 365)),
                                  firstDate: new DateTime.now(),
                                );
                              
                                // CreateEventFinalValues.pickedTime = pickedDate;
                                allerCT.text=pickedDate!.start.toString().substring(0,pickedDate!.start.toString().indexOf(" "));
                                retourCT.text=pickedDate!.end.toString().substring(0,pickedDate!.end.toString().indexOf(" "));
                                
                              },
              ),
              SizedBox(),
              TextButton(onPressed:()async{
                
                 await updateFlight(countryCT.text, allerCT.text, retourCT.text, 
                                                     PrixCT.text, photoCT.text, seatsCT.text);
                  
                
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

  void setState(Null Function() param0) {}
}