import 'package:flutter/material.dart';

import '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El Hub")),
        body: Center(
          child: Row(children: [
            Text("Velkommen ${sessionManager.signedInUser?.userName}"),
          ]),
        ));
  }
}
