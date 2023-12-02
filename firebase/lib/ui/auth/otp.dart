// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final verificationId;
  final name;
  const OtpScreen({super.key, this.verificationId, this.name,});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Screen'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
              controller: controller,
              validator: (value){
                if(value!.length < 7){
                  return 'En az altý karakter giriniz';
                }
              },
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Code',
                prefixIcon: Icon(Icons.messenger),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 65
                child:ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    _authProvider.phoneNumberControl(
                      controller.text, widget.verificationId,widget.name).then((value)async{
                        if(value !null){
                          await Provider.of<UserProvider>(context).currentUser();
                          Get.offAll(()=>  LandingPage());
                        }
                    });
                  }
                },
                child:const Text(
                  'Check Code',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
       )
      ),
      ),
      );
    }
  }

