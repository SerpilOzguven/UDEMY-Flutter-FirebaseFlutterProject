import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = Provider.of<UserProvider>(context,listen: false).user.name!;
  }


  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller ,
                decoration: const InputDecoration(hintText:'Name',border: OutlineInputBorder()),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width:Get.width,
                height: 150,
                child: ElevatedButton(
                  onPressed: (){
                    _userProvider.updateUser(
                        controller.text, _userProvider.user.id!);
                  },
                  child:const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
