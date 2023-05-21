import 'package:flutter/material.dart';

import '../../../../../main.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(23, 176, 245, 1)),
          
        ),
        onPressed: () => {
          sessionManager.signOut(),
        },
        child: Row(
          children: const [
            Icon(Icons.logout),
            Text("Log ud", style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
