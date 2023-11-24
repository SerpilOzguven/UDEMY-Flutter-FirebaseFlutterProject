import 'package:firebase/ui/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final isLogin;
  const HomePage({super.key, this.isLogin});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    if (widget.isLogin != null) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Get.snackbar('Baþarýlý', 'Baþarýyla giriþ yapýldý',
            backgroundColor: Colors.green, colorText: Colors.white);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home Page'),
        actions: [
          IconButton(onPressed: (){
            authProvider.signOut(); //.then((value) => Get.offAll(()=>const LandingPage()));
          }, icon:const Icon(Icons.logout))
        ],
       ),
      body: Container(),
    );
  }
}
