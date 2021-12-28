import 'package:flutter/material.dart';
import 'package:flutterproject/pages/acceuilFlight.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/pages/widgets/addFlight.dart';
import 'package:flutterproject/widgets/home.dart';
import 'widgets/vols_item.dart';
import 'package:hexcolor/hexcolor.dart';

// void main() {
//   runApp(LoginUiApp());
// }

// class LoginUiApp extends StatelessWidget {
//   Color _primaryColor = HexColor('#DC54FE');
//   Color _accentColor = HexColor('#8A02AE');

//   // Design color
//   // Color _primaryColor= HexColor('#FFC867');
//   // Color _accentColor= HexColor('#FF3CBD');

//   // Our Logo Color
//   // Color _primaryColor= HexColor('#D44CF6');
//   // Color _accentColor= HexColor('#5E18C8');

//   // Our Logo Blue Color
//   //Color _primaryColor= HexColor('#651BD2');
//   //Color _accentColor= HexColor('#320181');

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Login UI',
//       theme: ThemeData(
//         primaryColor: _primaryColor,
//         accentColor: _accentColor,
//         scaffoldBackgroundColor: Colors.grey.shade100,
//         primarySwatch: Colors.grey,
//       ),
//       home: SplashScreen(title: 'Flutter Login UI'),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
