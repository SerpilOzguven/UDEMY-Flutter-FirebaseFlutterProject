// TODO Implement this library.
import 'package:firebase/ui/register.dart';
import 'package:firebase/provider/auth_provider.dart';
import 'package:firebase/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
        title: const Text('Login'),
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
                loginButton(authProvider, context),
                sizedBox,
                goRegister();
                sizedBox,
                sizedBox,

                signInWithGoogle(authProvider, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector goRegister() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const Register());
      },
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text('Hesabýnýz yok mu? Üye olun!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  GestureDetector signInWithGoogle(
      authProvider, BuildContext context) {
    return GestureDetector(
                onTap: (){
                  authProvider.loginWithEmail().then((value) {
                    Get.offAll(()=>const LandingPage(isLogin:true));
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

  SizedBox loginButton(AuthProvider authProvider, BuildContext context) {
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
            if(value.runtimeType == User) {
              Get.offAll(()=>const LandingPage());
            }else{


            }
          });
        }else{
          authProvider.registerWithPhoneNumber(phoneController.text);
        }
      }
    },
    child:const Text(
      'Login',
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
      validator: (value) {
        /*
        bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value!);
        if(!emailValid) {
          return 'Lütfen geçerli email giriniz';
        }

         */
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),

      ),
    );
  }

