import 'package:flutter/material.dart';
import 'package:flutterproject/models/filghtsM.dart';
import 'package:http/http.dart' as http;
class addFlight extends StatefulWidget {
  const addFlight({ Key? key }) : super(key: key);

  @override
  _addFlightState createState() => _addFlightState();
}

class _addFlightState extends State<addFlight> {
 
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
Future<filghtsModel?> addFlight(String country,String dateAller,String dateRetour,String prix,String photo ,String RemainingSeats)async{
      var url='http://localhost:3000/api/addFlight';
      final res= await http.post(Uri.parse(url),body: {
       "country":country,
        "date_aller":dateAller,
        "date_retour":dateRetour,
        "prix":prix,
        "photo":photo,
        "Remaining_Seats":RemainingSeats
      });
      if (res.statusCode==200){
         String response=res.body;
         return FILGHTSFOMJSON(response);
      }
      else{
        return null;
      }
}
  final TextEditingController countryCT=TextEditingController();
  final TextEditingController allerCT=TextEditingController();
  final TextEditingController retourCT=TextEditingController();
  final TextEditingController PrixCT=TextEditingController();
  final TextEditingController photoCT=TextEditingController();
  final TextEditingController seatsCT=TextEditingController();

  
  
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
                  labelText: "number of seats"
                ),
                controller: seatsCT,
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
                controller: photoCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "enter a photo";
                  }
                }
              ),
              SizedBox(),
              OutlineButton(onPressed:()async{
                final String country=countryCT.text;
                final String aller=allerCT.text;
                final String retour=retourCT.text;
                final String prix=PrixCT.text;
                final String photo=photoCT.text;
                final String seats=seatsCT.text;
                final filghtsModel? flight=await addFlight(country, aller, retour, prix, photo, seats);
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