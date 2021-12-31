import 'package:flutter/material.dart';
import 'package:flutterproject/admin/add_user.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';
import 'package:flutterproject/admin/update_user.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({Key? key}) : super(key: key);

  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: FutureBuilder<List>(
          future: Flights_reservation_service().getUSer(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Text("no data");
            }
            var data = snapshot.data;

            if (data == null) {
              return Text("null");
            }

            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TouchableOpacity(
                  child: Card(
                    child: ListTile(
                      tileColor: Colors.brown[100],
                      title: Text(data[index]['name']),
                      subtitle: Text(data[index]['email']),
                      leading: Text(data[index]['password']),
                      trailing: IconButton(
                          onPressed: () async {
                            await Flights_reservation_service()
                                .deleteUser(data[index]['_id']);
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateUser(
                                  id: data[index]["_id"],
                                )));
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        backgroundColor: Colors.orange[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}
