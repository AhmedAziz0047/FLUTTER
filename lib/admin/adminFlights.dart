import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_flight_admin.dart';
import 'package:flutterproject/admin/adminReservations.dart';
import 'package:flutterproject/admin/adminUsers.dart' ;
import 'package:flutterproject/admin/update_flight.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:touchable_opacity/touchable_opacity.dart';
class adminFlights extends StatefulWidget {
  const adminFlights({ Key? key }) : super(key: key);

  @override
  _adminFlightsState createState() => _adminFlightsState();
}
Future deleteFlight(String id)async{
  final deleteurl=(Uri.parse('http://192.168.1.16:3000/api/deleteFlight/$id'));
  final response =await http.delete(deleteurl);
  print(response.statusCode);
  print(response.body);
  return json.decode(response.body);
}
Future<List> getflights() async {
     try{
       print("api works");
        var res =await http.get(Uri.parse('http://192.168.1.16:3000/api/getFlights'));
        var decodedData=jsonDecode(res.body);
        print(decodedData);
        print("eearz");
        return decodedData;
     }catch(SocketException){
       return Future.error("api not works");
     }
  }

class _adminFlightsState extends State<adminFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List>(
          future: getflights(),
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
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      return TouchableOpacity(child:  Card(
                        child: ListTile(
                          title: Text(data![index]['country']),
                          subtitle: Text(data![index]['date_aller']),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "http://192.168.1.16:4200/" + data[index]['photo']
                            ),
                          ),
                          trailing: IconButton(onPressed: ()async{
                                await deleteFlight(data![index]['_id']);
                                      setState(() {
                                      });
                          }, icon: Icon(Icons.delete)),
                            
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => UpdateFlight(id: data![index]["_id"],)));

        
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
                                      builder: (context) => addFlightADmin()));
              },
              backgroundColor: Colors.orange[900],
              child: const Icon(Icons.add),
            ),
          
    );
  }
}
