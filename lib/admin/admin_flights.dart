import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_flight_admin.dart';
import 'package:flutterproject/admin/update_flight.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';

import 'package:touchable_opacity/touchable_opacity.dart';
class AdminFlights extends StatefulWidget {
  const AdminFlights({ Key? key }) : super(key: key);

  @override
  _AdminFlightsState createState() => _AdminFlightsState();
}



class _AdminFlightsState extends State<AdminFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List>(
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
                  return const Text("no data");
                }

                var data=snapshot.data;
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      return TouchableOpacity(child:  Card(
                        child: ListTile(
                          title: Text(data![index]['country']),
                          subtitle: Text(data[index]['date_aller']),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "http://192.168.1.16:4200/" + data[index]['photo']
                            ),
                          ),
                          trailing: IconButton(onPressed: ()async{
                                await Flights_reservation_service().deleteFlight(data[index]['_id']);
                                      setState(() {
                                      });
                          }, icon: const Icon(Icons.delete)),
                            
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => UpdateFlight(id: data[index]["_id"],)));

        
                      },
                      );
                   

                      
                    },
                );
            }
        ),
          
        
             floatingActionButton: FloatingActionButton(
              onPressed: (){
                   Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => AddFlightAdmin()));
              },
              backgroundColor: Colors.orange[900],
              child: const Icon(Icons.add),
            ),
          
    );
  }
}
