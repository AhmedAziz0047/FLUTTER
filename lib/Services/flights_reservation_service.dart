import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_user.dart';
import 'package:flutterproject/admin/admin_flights.dart';
import 'package:flutterproject/admin/admin_reservations.dart';
import 'package:flutterproject/admin/appbar_bottomnavbar.dart';
import 'package:flutterproject/pages/acceuil_flight.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/widgets/mytoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Flights_reservation_service {
  get id => null;

  /////////////////////notification////////
  notify(String nom, String pren, String confnumber) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: "Congrats " +
                nom +
                " " +
                pren +
                "your flight confiramation number is: ",
            body: confnumber));
  }

///////////////////flights//////////////////

// addFlight
  Future addFlight(context, String country, String dateAller, String dateRetour,
      String prix, String photo, String remainingSeats) async {
    var url = 'http://192.168.1.71:3000/api/addFlight';
    final res = await http.post(Uri.parse(url), body: {
      'country': country,
      'date_aller': dateAller,
      'date_retour': dateRetour,
      'prix': prix,
      'photo': photo,
      'Remaining_Seats': remainingSeats
    });
    print(res.statusCode);
    if (res.statusCode == 201) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AppbarBottomnavbar()));
    } else {
      MyToast().showtoast("Check your informations");
    }

    return json.decode(res.body);
  }

//getAllflights
  Future<List> getflights() async {
    try {
      print("api works");
      var res =
          await http.get(Uri.parse('http://192.168.1.71:3000/api/getFlights'));
      var decodedData = jsonDecode(res.body);
      // print(decodedData);
      // print("eearz");
      return decodedData;
    } catch (SocketException) {
      return Future.error("api not works");
    }
  }

//updateFlight
  Future updateFlight(String country, String dateAller, String dateRetour,
      String prix, String photo, String remainingSeats, String id) async {
    final url = Uri.parse('http://192.168.1.71:3000/api/editFlight/$id');
    final res = await http.put(url, body: {
      'country': country,
      'date_aller': dateAller,
      'date_retour': dateRetour,
      'prix': prix,
      'photo': photo,
      'Remaining_Seats': remainingSeats
    });
    print(res.statusCode);
    // print (res.statusCode);
    return json.decode(res.body);
  }

//deleteFlight
  Future deleteFlight(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/deleteFlight/$id'));
    final response = await http.delete(deleteurl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

//getFlightByid
  Future<Map> getOneFlight(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/getFlightbyid/$id'));
    final response = await http.get(deleteurl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

////////////////reservations//////////////////////

// addReservation admin
  Future addReservationAPI(
      context, String name, String lastN, String country, String email) async {
    var url = 'http://192.168.1.71:3000/api/addReservations';
    final res = await http.post(Uri.parse(url), body: {
      'country': country,
      'nomclient': lastN,
      'prenomclient': name,
      'email': email
    });
    print(res.statusCode);
    if (res.statusCode == 201) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AppbarBottomnavbar()));
    } else {
      MyToast().showtoast("Check your informations");
    }
    return json.decode(res.body);
  }

//addReservationClient
  Future addReservationClient(
      context, String name, String lastN, String country, String email) async {
    var url = 'http://192.168.1.71:3000/api/addReservations';
    final res = await http.post(Uri.parse(url), body: {
      'country': country,
      'nomclient': lastN,
      'prenomclient': name,
      'email': email
    });
    if (res.statusCode == 200) {
      String ch = "0123456789";
      String confN = "";
      for (int i = 0; i < 30; i++) {
        confN += ch[Random().nextInt(10)];
      }
      Flights_reservation_service().notify(name, lastN, confN);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AcceuilFlight()));
    } else {
      MyToast().showtoast("Check your informations");
    }

    // print(res.statusCode);
    return json.decode(res.body);
  }

//getReservations
  Future<List> getRes() async {
    try {
      print("api works");
      var res = await http
          .get(Uri.parse('http://192.168.1.71:3000/api/getReservations'));
      var decodedData = jsonDecode(res.body);
      print(decodedData);
      print("works");
      return decodedData;
    } catch (SocketException) {
      return Future.error("api not works");
    }
  }

//updateReservation
  Future updateReservadmin(context, String country, String nameP, String lastP,
      String emailP, String id) async {
    final url = Uri.parse('http://192.168.1.71:3000/api/editReservations/$id');
    final res = await http.put(url, body: {
      'country': country,
      'nomclient': nameP,
      'prenomclient': lastP,
      'email': emailP
    });
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AppbarBottomnavbar()));
    } else {
      MyToast().showtoast("Please your infos");
    }
    // print (res.statusCode);
    return json.decode(res.body);
  }

//get reservationbyid
  Future<Map> getOneReserv(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/getReservbyid/$id'));
    final response = await http.get(deleteurl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  //deleteReservation
  Future deleteRes(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/deleteReservations/$id'));
    final response = await http.delete(deleteurl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
  ////////////////Users//////////////////////

  // User admin
  Future AddUserAPI(context, String name, String email, String password) async {
    var url = 'http://192.168.1.71:3000/api/auth/api/addUser';
    final res = await http.post(Uri.parse(url),
        body: {'name': name, 'email': email, 'password': password});
    print(res.statusCode);
    if (res.statusCode == 201) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AppbarBottomnavbar()));
    } else {
      MyToast().showtoast("Check your informations");
    }
    return json.decode(res.body);
  }

//addUserClient
  Future addUSerClient(
      context, String name, String email, String password) async {
    var url = 'http://192.168.1.71:3000/api/auth/api/addUser';
    final res = await http.post(Uri.parse(url),
        body: {'name': name, 'email': email, 'password': password});
    if (res.statusCode == 200) {
      String ch = "0123456789";
      String confN = "";
      for (int i = 0; i < 30; i++) {
        confN += ch[Random().nextInt(10)];
      }
      Flights_reservation_service().notify(name, email, password);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AcceuilFlight()));
    } else {
      MyToast().showtoast("Check your informations");
    }

    // print(res.statusCode);
    return json.decode(res.body);
  }

  //getUsers
  Future<List> getUSer() async {
    try {
      print("api works");
      var res = await http
          .get(Uri.parse('http://192.168.1.71:3000/api/auth/api/getUsers'));
      var decodedData = jsonDecode(res.body);
      print(decodedData);
      print("works");
      return decodedData;
    } catch (SocketException) {
      return Future.error("api not works");
    }
  }

//updateUser
  Future updateUseradmin(
      context, String name, String email, String password) async {
    final url = Uri.parse('http://192.168.1.71:3000/api/auth/api/editUser/$id');
    final res = await http
        .put(url, body: {'name': name, 'email': email, 'password': password});
    if (res.statusCode == 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AppbarBottomnavbar()));
    } else {
      MyToast().showtoast("Please your infos");
    }
    // print (res.statusCode);
    return json.decode(res.body);
  }

//get userreservationbyid
  Future<Map> getOneUser(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/auth/api/getUserbyid/$id'));
    final response = await http.get(deleteurl);
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  //deleteUser
  Future deleteUser(String id) async {
    final deleteurl =
        (Uri.parse('http://192.168.1.71:3000/api/auth/api/deleteUser/$id'));
    final response = await http.delete(deleteurl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
}
