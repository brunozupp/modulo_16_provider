import 'package:flutter/material.dart';
import 'package:modulo_16_provider/change_notifier/change_notifier_page.dart';
import 'package:modulo_16_provider/change_notifier/provider_controller.dart';
import 'package:modulo_16_provider/provider/provider_page.dart';
import 'package:modulo_16_provider/provider/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: "Lucas Lancaster", 
              imgAvatar: "https://mundoavatar.com.br/wp-content/uploads/2021/07/avatar-filme.jpeg", 
              birthDate: "19/07/2014",
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/provider" : (_) => const ProviderPage(),
          "/change_notifier" : (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/provider");
                      }, 
                      child: const Text("Provider"),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/change_notifier");
                      }, 
                      child: const Text("Change Notifier"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}