import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final facebookAppEvents = FacebookAppEvents();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // ignore: invalid_use_of_visible_for_testing_member
        future: FacebookAuth.getInstance().getUserData(), //? Obtengo datos del inicio de sesion
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();

          final user = snapshot.data;
          return FutureBuilder(
              future: facebookAppEvents.setUserID(
                user!["id"],
              ), //? Los guardo en el evento para saber quien envio el evento
              builder: (context, snapshot) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            //Esto crea el evento( tarda aprox 5 min)
                            //Una presionada mas, agrega un evento (40 min aprox)
                            await facebookAppEvents.logEvent(
                              name: 'comprar_seguro',
                              parameters: {
                                'costo': '1282.313',
                              },
                            );
                          },
                          child: const Text("Enviar Custom Evento"),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
