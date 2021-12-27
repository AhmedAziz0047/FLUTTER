import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
class acceuilFlight extends StatelessWidget {
   final String imgurl="https://www.celebritycruises.com/blog/content/uploads/2020/08/italy-in-the-summer-cinque-terre-hero-1600x890.jpg";


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    var cardImage = const NetworkImage(
        'https://source.unsplash.com/random/800x600?house');
    return Container(
      margin:EdgeInsets.all(height*.025),
      child: TouchableOpacity(
        child: Card(
            elevation: 8.0,
            child: Column(
              children: [
                ListTile(
                  title: Text("Italy"),
                  subtitle: Text("aller: 31/12/2021 - retour: ?????"),
                  trailing: Icon(Icons.favorite_outline),
                ),
                Container(width: height*0.4,height:height*0.3,
                  child: ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network('https://source.unsplash.com/random/800x600?house'),),
                ),
                // Container(
                //   height: 200.0,
                //   child: Ink.image(
                //     image: cardImage,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text("aa"),
                ),
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
      ),
    );
  }
}

