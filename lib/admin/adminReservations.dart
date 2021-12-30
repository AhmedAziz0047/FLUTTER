import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_reservation_admin.dart';
import 'package:flutterproject/admin/update_reservation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:touchable_opacity/touchable_opacity.dart';
class adminReservations extends StatefulWidget {
  const adminReservations({ Key? key }) : super(key: key);

  @override
  _adminReservationsState createState() => _adminReservationsState();
}
Future deleteRes(String id)async{
  final deleteurl=(Uri.parse('http://192.168.1.16:3000/api/deleteReservations/$id'));
  final response =await http.delete(deleteurl);
  print(response.statusCode);
  print(response.body);
  return json.decode(response.body);
}
Future<List> getRes() async {
     try{
       print("api works");
        var res =await http.get(Uri.parse('http://192.168.1.16:3000/api/getReservations'));
        var decodedData=jsonDecode(res.body);
        print(decodedData);
        print("works");
        return decodedData;
     }catch(SocketException){
       return Future.error("api not works");
     }
  }

class _adminReservationsState extends State<adminReservations> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: FutureBuilder<List>(
          future: getRes(),
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

                  if (data==null){
                    return Text("null");
                  }
                
                    return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      return TouchableOpacity(child:  Card(
                        child: ListTile(
                          title: Text(data[index]['nomclient']),
                          subtitle: Text(data[index]['prenomclient']),
                          leading: Text(data[index]['email']),
                          trailing: IconButton(onPressed: ()async{
                                await deleteRes(data[index]['_id']);
                                      setState(() {
                                      });
                          }, icon: Icon(Icons.delete)),  
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                      builder: (context) => UpdateReserv(id: data[index]["_id"],)));

        
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
                                      builder: (context) => addReservationAdmin()));
              },
              backgroundColor: Colors.orange[900],
              child: const Icon(Icons.add),
            ),
         
          
        
            
          
    );
  }
}