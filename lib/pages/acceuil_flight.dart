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
                                      elevation: 8.0,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),child: 
                                            Image.network("http://192.168.1.16:4200/" + data[index]['photo']),),
                                          ),
                                         
                                          ListTile(
                                            
                                            title: Text(data[index]["country"]),
                                            subtitle:Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                              Text(data[index]["date_aller"]),
                                              SizedBox(width: 10),
                                              Text(data[index]["date_retour"])
                                            ],), 
                                            trailing: Icon(Icons.favorite_outline),
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
                                                child: const Text("Take your place"),
                                                onPressed: () {/* ... */},
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

