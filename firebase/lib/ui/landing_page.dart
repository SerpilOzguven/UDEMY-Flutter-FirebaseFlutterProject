import 'package:firebase/ui/auth/home_page.dart';
import 'package:firebase/ui/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase/ui/home_page.dart';
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
    final _authProvider = Provider.of<AuthProvider>(context);
    return  Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),);
            }else if(snapshot.hasData) {
              if(_authProvider.user.id != null){
                return const HomePage();
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }else if(snapshot.hasError){
              return Center(
                  child: Text('Bir hata var' + snapshot.error.toString()),);
            }else{
              return Register();
            }
          }),
    );
  }
}

