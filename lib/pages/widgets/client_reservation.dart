import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/pages/acceuilFlight.dart';
import 'package:flutterproject/pages/widgets/bg_client_reservation.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'notification_service.dart';

class clientReservation extends StatefulWidget {
  String id;
   clientReservation({ Key? key, required this.id }) : super(key: key);
    
  @override
  _clientReservationState createState() => _clientReservationState(id);
}
Future addReservationClient(String Name,String LastN,String Country,String Email)async{
      var url='http://192.168.1.16:3000/api/addReservations';
      final res= await http.post(Uri.parse(url),body: {
       'country':Country,
        'nomclient':LastN,
        'prenomclient':Name,
        'email':Email
      });
      print(res.statusCode);
      return json.decode(res.body);
}
  
  final TextEditingController nameCT=TextEditingController();
  final TextEditingController last=TextEditingController();
  final TextEditingController email=TextEditingController();

const TextStyle kHeading=TextStyle(fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                     );
const TextStyle inputStyle=TextStyle(fontSize: 20,color: Colors.white);
// const TextStyle inputStyle=TextStyle(fontSize: 20,color:Colors.white);

class _clientReservationState extends State<clientReservation> {
  
  String id;
  
  _clientReservationState(this.id);
  @override
  Widget build(BuildContext context) {
    final TextEditingController countryCT=TextEditingController(text:id );
    return Stack(
     children:[
       bgClientR(),
       Scaffold(
         backgroundColor:Colors.transparent,
         body:SafeArea(
           child: Column(
             children: [
              //   Container(child: 
              //   Center(
              //     child:  
              //     Text('Take The Trip',style: kHeading,),
              //     )
              // ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:
                Column(
                  children:[ 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                            controller: nameCT,
                            decoration: InputDecoration(
                            contentPadding:  const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Name",
                            prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Icon(FontAwesomeIcons.user,color: Colors.white,size: 30,),
                            ),
                            hintStyle:inputStyle,
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[600]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                          controller: last,
                          decoration: InputDecoration(
                          contentPadding:  const EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                          hintText: "Last Name",
                          prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Icon(FontAwesomeIcons.user,color: Colors.white,size: 30,),
                          ),
                          hintStyle:inputStyle,
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                            contentPadding:  const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Icon(FontAwesomeIcons.solidEnvelope,color: Colors.white,size: 30,),
                            ),
                            hintStyle:inputStyle,
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                       Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                            readOnly: true,
                            controller: countryCT,
                            decoration: InputDecoration(
                            contentPadding:  const EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Destination",
                            prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Icon(FontAwesomeIcons.planeArrival,color: Colors.white,size: 30,),
                            ),
                            hintStyle:inputStyle,
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
              
                         TextButton(onPressed: ()async{
                          //  MyToast().showtoast("fdsgfsd");
                              //  await NotificationService().showNotification(1,"title","body",5);
                            await addReservationClient(nameCT.text,last.text,countryCT.text,email.text );
                        }, child: Text("Take a seat")),
                 
                    
                    
                    
                
                ]
              )
                

             
           ),
           
             ]
             )
       )
       )
       ]
    );
       

    
  }
}