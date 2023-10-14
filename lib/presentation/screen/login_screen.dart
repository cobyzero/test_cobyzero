import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final LoginResult result = await FacebookAuth.instance.login();

                  if (result.status == LoginStatus.success) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, "/home");
                  } else {
                    // print(result.status);
                    // print(result.message);
                  }
                },
                child: const Text("Facebook"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
