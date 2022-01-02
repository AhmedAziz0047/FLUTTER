import 'package:flutter/material.dart';
import 'package:flutterproject/Services/flights_reservation_service.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key, required this.id}) : super(key: key);
  final String id;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameU = TextEditingController();
  final TextEditingController emailU = TextEditingController();
  final TextEditingController passwordU = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update user"),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: FutureBuilder<Map>(
            future: Flights_reservation_service().getOneUser(id),
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
                return const Text("no data");
              }
              var data = snapshot.data;
              final TextEditingController nameU =
                  TextEditingController(text: data!['name']);
              final TextEditingController emailU =
                  TextEditingController(text: data['email']);
              final TextEditingController passwordU =
                  TextEditingController(text: data['password']);

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        controller: nameU,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter A Name";
                          }
                        }),
                    const SizedBox(),
                    TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        controller: emailU,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the Email";
                          }
                        }),
                    const SizedBox(),
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        controller: passwordU,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          }
                        }),
                    const SizedBox(),
                    TextButton(
                      onPressed: () async {
                        await Flights_reservation_service().updateUseradmin(
                            context, nameU.text, emailU.text, passwordU.text);

                        // MyToast().showtoast(status.statusCode == 201 ? "added successfuly" : "verif your data");
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
