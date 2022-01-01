import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';

class AddUserAdmin extends StatelessWidget {
  AddUserAdmin({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text("Add new user"),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                TextFormField(
                    decoration: const InputDecoration(labelText: "User Name"),
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter name";
                      }
                    }),
                const SizedBox(),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the price";
                      }
                    }),
                const SizedBox(),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password";
                      }
                    }),
                const SizedBox(),
                OutlineButton(
                    onPressed: () async {
                      final reser = await Flights_reservation_service()
                          .AddUserAPI(
                              context, name.text, email.text, password.text);
                    },
                    child: Text('ADD')),
              ],
            ),
          ),
        ));
  }
}
