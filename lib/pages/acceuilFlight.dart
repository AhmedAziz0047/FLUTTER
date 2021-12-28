
import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class acceuilFlight extends StatelessWidget {
  


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

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
          appBar: AppBar(
            title: Text("Our Trips"),
          ),
          body: SingleChildScrollView(child: FutureBuilder<List>(
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
                                        MyToast().showtoast("resussi");
                                      },
                                );
                          }));
                
            }
            ),
          ),
            );
    
   
    // double height=MediaQuery.of(context).size.height;
    // var cardImage = const NetworkImage(
    //     'https://source.unsplash.com/random/800x600?house');
    //     return Scaffold(
    //      body: Center(
    //        child: Text('zaea')
    //      ),
    //     );
    // return Container(
    //   margin:EdgeInsets.all(height*.025),
    //   child: TouchableOpacity(
    //     child: Card(
    //         elevation: 8.0,
    //         child: Column(
    //           children: [
    //             ListTile(
    //               title: Text("Italy"),
    //               subtitle: Text("aller: 31/12/2021 - retour: ?????"),
    //               trailing: Icon(Icons.favorite_outline),
    //             ),
    //             Container(width: height*0.4,height:height*0.3,
    //               child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network('https://source.unsplash.com/random/800x600?house'),),
    //             ),
    //             // Container(
    //             //   height: 200.0,
    //             //   child: Ink.image(
    //             //     image: cardImage,
    //             //     fit: BoxFit.cover,
    //             //   ),
    //             // ),
    //             Container(
    //               padding: EdgeInsets.all(16.0),
    //               alignment: Alignment.centerLeft,
    //               child: const Text("aa"),
    //             ),
    //             ButtonBar(
    //               children: [
    //                 TextButton(
    //                   child: const Text("Take your place"),
    //                   onPressed: () {/* ... */},
    //                 ),
    //               ],
    //             )
    //           ],
    //         )),
    //         onTap: (){
    //           MyToast().showtoast("resussi");
    //         },
    //   ),
    // );
  }
}

