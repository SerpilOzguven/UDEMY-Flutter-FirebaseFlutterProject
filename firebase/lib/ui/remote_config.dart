import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

class RemoteConfig extends StatefulWidget {
  const RemoteConfig({super.key});

  @override
  State<RemoteConfig> createState() => _RemoteConfigState();
}


class _RemoteConfigState extends State<RemoteConfig> {
  @override
  void initState() {
    super.initState();
    setupRemoteConfig();
  }

  void setupRemoteConfig() async {
    RemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.ensureInitialized();
    //await remoteConfig.fetch();
    //await remoteConfig.activate();
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
      ),
    );
    var result = remoteConfig.getBool('isUpdate');

    //print(remoteConfig.getString('title'));
    if (result == true){
      Get.showSnackbar(
        const GetSnackBar(
          title:'G�ncelleme',
            message:'G�ncelleme var ve zorunlu', duration:Duration(seconds: 1),
      ));
    }else{
      Get.showSnackbar(
        GetSnackBar(
          title:'G�ncelleme',
          message:'G�ncelleme var ve zorunlu de�il',
              duration: Duration(seconds: 1),
        ));
      }
    }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*
minimumFetchInterval: Duration(minutes: 3),
minimumFetchInterval: Duration(seconds:1) oldu�unda false d�ner, her saniyede g�nceller
anl�k olrak dinlemek istiyorsak miliseconds:1 yazaca��z s�reyi azaltaca��z

 */