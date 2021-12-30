import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';
import 'package:flutterproject/pages/widgets/client_reservation.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
class AcceuilFlight extends StatelessWidget {
  const AcceuilFlight({Key? key}) : super(key: key);

  


  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Our Trips"),
            backgroundColor: Colors.orange[700],
          ),
          body: SingleChildScrollView(child: FutureBuilder<List>(
            future: Flights_reservation_service().getflights(),
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
                  return Text("no data");
                }

                var data=snapshot.data;
                return Wrap(
                          children: List<Widget>.generate(data!.length, (index) {
                                return TouchableOpacity(
                                  child: Card(
                                      color: Colors.grey[350],
                                      elevation: 8.0,
                                      child: Column(
                                        
                                        children: [
                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(0),bottomLeft: Radius.circular(0)),child: 
                                          Image.network("http://192.168.1.16:4200/" + data[index]['photo']),),
                                         
                                          ListTile(
                                            
                                            title: Text(data[index]["country"]),
                                            subtitle:Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                              Text(data[index]["date_aller"]),
                                              const SizedBox(width: 10),
                                              Text(data[index]["date_retour"])
                                            ],), 
                                            
                                          ),
                                          
                                          // Container(
                                          //   height: 200.0,
                                          //   child: Ink.image(
                                          //     image: cardImage,
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                          ButtonBar(
                                            children: [
                                              TextButton(
                                                child: const Text("Take your place",style: TextStyle(color: Colors.black),),
                                                onPressed: () {
                                                  Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                              builder: (context) => ClientReservation(id:data[index]["country"],)));
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                      onTap: (){
                                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                              builder: (context) => ClientReservation(id:data[index]["country"],)));
                                      },
                                );
                          }));
                
            }
            ),
          ),
            );
    
   
    
  }
}

