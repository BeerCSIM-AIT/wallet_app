import 'package:flutter/material.dart';
import 'package:wallet_app/models/user.model.dart';
import 'package:wallet_app/services/user.service.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<User> currentUser;
  String id = "63eba6e3f414e740412db3e6";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = UserService().getUser(id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("NVC E-Wallet"),
        ),
        body: FutureBuilder<User>(
          future: currentUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data!.name),
                  Text(snapshot.data!.balance.toString()),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
