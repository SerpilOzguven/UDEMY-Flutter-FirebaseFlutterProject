// TODO Implement this library.// TODO Implement this library.
import 'package:firebase/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var email = true;

  var sizedBox = const SizedBox(height: 20,);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if(isEmail)
                  Column(
                    children: [
                      emailInput(),
                      sizedBox,
                      passwordInput(),
                    ],
                  )
                else
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if(value!.length < 9){
                        return 'En az dokuz karakter giriniz';
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Register With Email'),
                    Checkbox(value: isEmail, onChanged: (value){
                      setState(() {
                        isEmail = value!;
                      });
                    }),
                  ],
                ),
                sizedBox,
                registerButton(authProvider, context),
                sizedBox,


                GestureDetector(
                  onTap: (){
                    Get.off(()=> const Login());
                  },
                  child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Hesab�n�z var n�? Giri� yap�n!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                sizedBox,
                sizedBox,
                signInWithGoogle(authProvider, context),
            ],
        ),
          ),
      ),
    ),
  );
}

  GestureDetector signInWithGoogle(authProvider, BuildContext context) {
    return GestureDetector(
                onTap: (){
                  authProvider.registerWithGoogle().then((value) {
                    if(value != null){
                      Get.snackbar('Ba�ar�l�','Ba�ar�yla giri� yap�ld�',
                          backgroundColor: Colors.green, colorText:Colors.white);
                    }
                  });
                },
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400,offset: Offset(0, 0),blurRadius: 3,spreadRadius: 3)
                    ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google_icon.png',height: 30,),
                      const SizedBox(width: 10)
                      const Text('Sign in With Google',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                ],
            )),
              );
  },

  SizedBox registerButton(AuthProvider authProvider, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65
      child:ElevatedButton(onPressed: (){
        if(formKey.currentState!.validate()){
          if(isEmail){
            authProvider
              .registerWithEmail(
              emailController.text, passwordController.text)
              .then((value) {
            if(value != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(value),duration:const Duration(seconds: 1),
                ),
              ),
            }
          });
        }else{
          authProvider.registerWithPhoneNumber(phoneController.text);
        }
      }
    },
    child:const Text(
      'Register',
      style: TextStyle(fontSize: 22),
      ),
    ),
  );
}

  TextFormField passwordInput() {
    return TextFormField(
              controller: phoneController,
              validator: (value){
                if(value!.length <9){
                  return 'En az dokuz karakter giriniz';
                  }
                },
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),

              ),
            );
  }

  TextFormField emailInput() {
    return TextFormField(
              controller: emailController,
              validator: (value){
                bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                    .hasMatch(value!);
                  if(!emailValid) {
                    return 'L�tfen ge�erli email giriniz';
                  }
                },
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),

              ),
            );
  }
}
