import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../main.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Dialog(
          child: Container(
            width: 260,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignInWithEmailButton(
                  caller: client.modules.auth,
                  onSignedIn: () => Navigator.pushReplacementNamed(context, "/home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
