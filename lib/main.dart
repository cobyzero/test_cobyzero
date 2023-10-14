import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class MyLogin extends StatelessWidget {
  static final facebookAppEvents = FacebookAppEvents();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // ignore: invalid_use_of_visible_for_testing_member
        future: FacebookAuth.getInstance().getUserData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();

          final user = snapshot.data;
          return FutureBuilder(
              future: facebookAppEvents.setUserData(
                firstName: user!["name"],
              ),
              builder: (context, snapshot) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Plugin example app'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await facebookAppEvents.logEvent(
                              name: 'comprar_seguro',
                              parameters: {
                                'costo': '1282.313',
                              },
                            );
                            //await facebookAppEvents.flush();
                          },
                          child: const Text("Enviar Custom Evento"),
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            await facebookAppEvents.logEvent(
                              name: 'button_clicked',
                              parameters: {
                                'button_id': 'the_clickme_button',
                              },
                            );
                          },
                          child: const Text("Enviar Rated"),
                        ),

                        // MaterialButton(
                        //   child: Text("Test purchase!"),
                        //   onPressed: () {
                        //     facebookAppEvents.logPurchase(amount: 1, currency: "USD");
                        //   },
                        // ),
                        // MaterialButton(
                        //   child: Text("Enable advertise tracking!"),
                        //   onPressed: () {
                        //     facebookAppEvents.setAdvertiserTracking(enabled: true);
                        //   },
                        // ),
                        // MaterialButton(
                        //   child: Text("Disabled advertise tracking!"),
                        //   onPressed: () {
                        //     facebookAppEvents.setAdvertiserTracking(enabled: false);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
