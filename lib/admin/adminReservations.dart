import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
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
                    return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(data![index]['email']),
                          subtitle: Text(data![index]['nomclient'] +" " + data![index]['prenomclient' ]),
                          leading: Text(data![index]['country']),
                          
                          trailing: IconButton(onPressed: ()async{
                                await deleteRes(data![index]['_id']);
                                      setState(() {
                                      });
                          }, icon: Icon(Icons.delete)),
                            
                        ),
                      );
                   

                      
                    },
                );
            }
        ),
         floatingActionButton: FloatingActionButton(
              onPressed: (){},
              backgroundColor: Colors.orange[400],
              child: const Icon(Icons.add),
            ),
          
        
            
          
    );
  }
}