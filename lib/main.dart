// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';



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
  
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null,[NotificationChannel(channelKey: 'key1', 
  channelName: 'reserNotif', 
  channelDescription: 'Description',
  defaultColor: const Color(0XFF9050DD),
  ledColor: Colors.white,
  playSound: true,
  enableLights: true,
  enableVibration: true
  )
  ],
    );
  
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
      home: const LoginPage(),
    );
  }
}

