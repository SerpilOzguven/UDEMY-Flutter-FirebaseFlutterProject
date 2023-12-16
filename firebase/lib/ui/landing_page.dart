import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LandingPage extends StatefulWidget {
  final isLogin;

  const LandingPage({super.key, this.isLogin});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return  Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Provider.of(context, listen: false).currentUser();
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}