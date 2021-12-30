import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class addFlightADmin extends StatefulWidget {
  const addFlightADmin({ Key? key }) : super(key: key);

  @override
  _addFlightADminState createState() => _addFlightADminState();
}
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
class _addFlightADminState extends State<addFlightADmin> {
  final TextEditingController countryCT=TextEditingController();
  final TextEditingController allerCT=TextEditingController();
  final TextEditingController retourCT=TextEditingController();
  final TextEditingController PrixCT=TextEditingController();
  final TextEditingController photoCT=TextEditingController();
  final TextEditingController seatsCT=TextEditingController();
  late http.Response status;

Future addFlight(String country,String dateAller,String dateRetour,String prix,String photo ,String RemainingSeats)async{
      var url='http://192.168.1.16:3000/api/addFlight';
      final res= await http.post(Uri.parse(url),body: {
       'country':country,
        'date_aller':dateAller,
        'date_retour':dateRetour,
        'prix':prix,
        'photo':photo,
        'Remaining_Seats':RemainingSeats
      });
      print(res.statusCode);
      setState(() {
        status=res;
      });
      return json.decode(res.body);
}

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: Text("Add flight"),
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
                  labelText: "Departure Date"
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
                  labelText: "arrival Date"
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
                  labelText: "price"
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
                  labelText: "Photo"
                ),
                controller: photoCT,
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
                
                 await addFlight(countryCT.text, allerCT.text, retourCT.text, 
                                                     PrixCT.text, photoCT.text, 
                                                     seatsCT.text);
                  
                
                MyToast().showtoast(status.statusCode == 201 ? "added successfuly" : "verif your data");
              },
              child:Text('ADD'),
              ),
              
            ],
          ),
          ),
        )
    );
  }
}