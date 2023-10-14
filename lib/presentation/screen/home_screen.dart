import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:test_cobyzero/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/home": (context) => MyLogin(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  final LoginResult result = await FacebookAuth.instance
                      .login(); // by default we request the email and the public profile
                  // or FacebookAuth.i.login()
                  if (result.status == LoginStatus.success) {
                    // you are logged
                    final AccessToken accessToken = result.accessToken!;
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, "/home");
                    print(accessToken.token);
                  } else {
                    print(result.status);
                    print(result.message);
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
