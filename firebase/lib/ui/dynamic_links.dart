import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinks extends StatefulWidget {
  const DynamicLinks({super.key});

  @override
  State<DynamicLinks> createState() => _DynamicLinksState();
}

class _DynamicLinksState extends State<DynamicLinks> {

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final String Link = 'https://serpilozguven.page.link/Tbeh';

  @override
  void initState() {
    super.initState();
    listenDynamicLinks();
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
            ElevatedButton(onPressed: () async {
               final data = await dynamicLinks.getDynamicLink(Uri.parse(Link));
               final Uri? deepLink = data?.link;
               if (deepLink != null){
                 print('deepLink $deepLink');
               }else{
                 print('deepLink null');
               }
            }, child: const Text('Get dynamic link')),
          ],
        ),
      ),

    );
  }

  void listenDynamicLinks()async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      if(dynamicLinkData != null){
        print('dynamicLinkData $dynamicLinkData');
      }else{
        print('dynamicLinkData null');
      }
    });
    
  }
}
