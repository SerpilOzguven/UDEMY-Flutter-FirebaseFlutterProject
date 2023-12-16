


import 'package:firebase/ui/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ChangeNotifier(),),
          ],
          child: GetMaterialApp(
            title: 'Firebase',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LandingPage(),
          ),

      ),

    );
  }
}