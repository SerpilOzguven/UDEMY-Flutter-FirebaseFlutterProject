import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    final _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_authProvider.user!.name!,style:const TextStyle(fontSize: 24),),
              const SizedBox(width: 20,),
              TextFormField(controller: controller , decoration:const InputDecoration(border:const OutlineInputBorder()),),
              const SizedBox(height: 20,),
              Container(width:Get.width,child: ElevatedButton(onPressed: (){
                _userProvider.updateUser(controller.text,_authProvider.user!.id!,context);
              }, child:const Text('Update')))
            ],
          ),
        ),
      ),
    );
  }
}
