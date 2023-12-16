// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.import 'package:firebase/model/user_model.dart';
import 'package:firebase/provider/user_provider.dart';
import 'package:firebase/provider/auth_provider.dart';
import 'package:firebase/ui/profile.dart';
import 'package:firebase/ui/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase/model/user_model.dart';

class HomePage extends StatefulWidget {
  final bool? isLogin;
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
    final _userProvider = Provider.of<UserProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    //Provider.of<UserProvider>(context).getMap();
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: (){
                authProvider.signOut().then((value){
                  _userProvider.user = UserModel();
            }); //.then((value) => Get.offAll(()=>const LandingPage()));
          },
              icon:const Icon(Icons.logout),
          ),
          IconButton(
              onPressed: (){
                Get.to(()=> const Profile()); //.then((value) => Get.offAll(()=>const LandingPage()));
          },
              icon:const Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: Text(_userProvider.user.id!),
      ),
    );
  }
}
