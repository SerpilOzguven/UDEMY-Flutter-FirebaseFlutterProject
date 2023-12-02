

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;


class DynamicLinks extends StatefulWidget {
  const DynamicLinks({super.key});

  @override
  State<DynamicLinks> createState() => _DynamicLinksState();
}

class _DynamicLinksState extends State<DynamicLinks> {

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final String Link = 'https://serpilozguven.page.link/Tbeh';

  String? ourLink;
  int number = 10;



  @override
  void initState() {
    super.initState();
    listenDynamicLinks();
    initDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Dynamic Links'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number.toString()),
            ElevatedButton(onPressed: () async {
               final data = await dynamicLinks.getDynamicLink(Uri.parse(Link));
               final Uri? deepLink = data?.link;
               if (deepLink != null){
                 print('deepLink $deepLink');
               }else{
                 print('deepLink null');
                 if(await canLaunch(deepLink.toString())){
                   launch(deepLink.toString());
                 }

               }
            }, child: const Text('Get dynamic link'),
            ),
            ElevatedButton(onPressed: (){
              var number = math.Random().nextInt(10);
              createDynamicLink(true,number);
            }, child: const Text ('Create Shorts Dynamic Link'),),
            ElevatedButton(onPressed: (){
              var number = math.Random().nextInt(10);
              createDynamicLink(false,number);
            }, child: const Text('Create Long Dynamic Link'),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onLongPress: (){
                Clipboard.setData(ClipboardData(text: ourLink!));
                Get.showSnackbar(GetSnackBar(message: 'Copied Link!',
                duration: Duration(seconds: 1),
                ));
              },
                onTap: ()async{
                  if (await canLaunch(ourLink!)){
                    launch(ourLink!);
              }
            },
                onDoubleTap: (){
                  Share.share(ourLink!);
                },
                child: Text(ourLink ?? '',style: TextStyle(color: Colors.blue),)),
          ],
        ),
      ),
    );
  }

  void listenDynamicLinks()async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      if (dynamicLinkData != null){
        print('dynamicLinkData $dynamicLinkData');
        print(dynamicLinkData.link.toString().split('/')[3]);
      }else{
        print('dynamicLinkData null');
      }
    });
    
  }

  void createDynamicLink(bool isShort, int number) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://serpilozguven.page.link/$number'),
      uriPrefix: 'https://serpilozguven.page.link/Tbeh',
      androidParameters: const AndroidParameters(
        packageName: 'com.example.firebase',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.firebase',
        minimumVersion: '0',

      ),
    );

    Uri url;
    if (isShort) {
      final shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
    setState(() {
      ourLink = url.toString();
    });

    //launch(urlString);
  }

  void initDynamicLinks() async {
    var deepLink = dynamicLinks.getInitialLink();
    if (deepLink != null) {
      setState(() {
        number = 20;
      });
    }else{
      setState(() {
        number = 30;
      });
    }

  }
}
