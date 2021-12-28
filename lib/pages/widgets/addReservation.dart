import 'package:flutter/material.dart';
import 'package:flutterproject/models/filghtsM.dart';
import 'package:http/http.dart' as http;

class addReservation extends StatefulWidget {
  const addReservation({ Key? key }) : super(key: key);

  @override
  _addReservationState createState() => _addReservationState();
}
  String countre="";
  String passName="";
  String  passLastNAme="";
  String passEmail="";
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

Future<filghtsModel?> addFlight(String country,String dateAller,String dateRetour,int prix,String photo ,int RemainingSeats)async{
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

class _addReservationState extends State<addReservation> {
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
                  labelText: "Passenger Name"
                ),
                controller:allerCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Passenger Name";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Passenger Last Name"
                ),
                controller:retourCT,
                validator: (value){
                  if (value!.isEmpty){
                    return "Enter Passenger Last Name";
                  }
                }
              ),
              SizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  
                  labelText: "Passenger email"
                ),
                
                validator: (value){
                  if (value!.isEmpty){
                    return "Passenger email";
                  }
                }
              ),
             
             
              SizedBox(),
              OutlineButton(onPressed:(){
          
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