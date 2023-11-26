
import 'package:firebase/provider/auth_provider.dart';
import 'package:firebase/provider/user_provider.dart';
import 'package:firebase/ui/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context)=>AuthProvider()),
        ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider())
      ],
      child: GetMaterialApp(
        title: 'Firebase',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const LandingPage (),
      ),
    );
  }
}
