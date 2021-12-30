import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';
import 'package:flutterproject/pages/widgets/bg_client_reservation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ClientReservation extends StatefulWidget {
  final String id;
   const ClientReservation({ Key? key, required this.id }) : super(key: key);
    
  @override
  _ClientReservationState createState() => _ClientReservationState(id);
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

class _ClientReservationState extends State<ClientReservation> {
  
  String id;
  
  _ClientReservationState(this.id);
  @override
  Widget build(BuildContext context) {
    final TextEditingController countryCT=TextEditingController(text:id );
    return Stack(
     children:[
       const BgClientR(),
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
              const SizedBox(
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
                            decoration: const InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Name",
                            prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
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
                          decoration: const InputDecoration(
                          contentPadding:  EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                          hintText: "Last Name",
                          prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
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
                            decoration: const InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
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
                            decoration: const InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(vertical: 20),
                            border: InputBorder.none,
                            hintText: "Destination",
                            prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
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
                              
                           await Flights_reservation_service().addReservationClient(context,nameCT.text,last.text,countryCT.text,email.text );
                            
                        }, child: const Text("Take a seat")),
                 
                    
                    
                    
                
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