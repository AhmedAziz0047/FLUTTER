
import 'package:awesome_notifications/awesome_notifications.dart';
class Service {
notify(String nom,String pren,String confnumber)async {
  await AwesomeNotifications().createNotification(content: NotificationContent(id: 1, 
  channelKey: 'key1',
  title: "Congrats "+nom+" "+ pren + "your flight confiramation number is: " ,
  body: confnumber));
}
}