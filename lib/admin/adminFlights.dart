import 'package:flutter/material.dart';
import 'package:flutterproject/admin/adminReservations.dart';
import 'package:flutterproject/admin/adminUsers.dart' ;
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
      appBar: AppBar(
          backgroundColor: Colors.orange[100],
          title: Text("Dashbord"),
      ),
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
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index) {
                      
                      return Container(
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal:16),
                        child: 
                        
                        Row(
                          children: [
                            Expanded(flex: 1,child:Image.network("http://192.168.1.16:4200/" + data![index]['photo'])),
                            Expanded(flex: 1,child:Text(data![index]['country'])),
                            Expanded(flex: 2,child:Text(data![index]['date_aller'])),
                          
                            Expanded(flex: 2,child:Column(
                              children: [
                                FlatButton.icon(onPressed: ()async{
                                      await deleteFlight(data![index]['_id']);
                                      MyToast().showtoast("deleted succ");
                                      setState(() {
                                        
                                      });
                                }, icon: Icon(Icons.delete), label: Text("")),
                              ],
                            )),
                             Expanded(flex: 2,child:Column(
                              children: [
                                FlatButton.icon(onPressed: (){
                                   MyToast().showtoast("resussi");
                                }, icon: Icon(Icons.edit), label: Text("")),
                              ],
                            )),
                          ],
                        ),

                      );
                    },
                    separatorBuilder: (context,index){
                      return Divider(
                          thickness: 0.5,
                          height: 0.5,
                      );
                    },
                );
            }
        )
          
        
            
          
    );
  }
}
