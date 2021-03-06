import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'dart:js' as js;

class LaunchResume {

  String scheme = WEB, projectLink = "drive.google.com/file/d/16lLIwnI6oPJR-d1kdhwOcJdieUFLWSAg/view";
  Map<String, dynamic> queryParameters = {
    "usp":"sharing"
  };

  Future<bool> launchLink() async {

    Uri uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);

    bool ableToLaunch = true;
    await canLaunchUrl(uri).then((bool result) {
      ableToLaunch = result;
    });

    print('projects_model.dart, L31: Not able to launch');

    if (!ableToLaunch) return false;

    if(kIsWeb){

      await launchUrl(Uri.parse('https://' + projectLink));
      print(uri.toString());
      // js.context.callMethod('open', [uri.toString()]);
    }else{
      // First we will try to launch it in Web View, if it fails, we will hen proceed to external browser
      if(!await _launchInWebView()){
        if(!await _launchInBrowser()){
          return false;
        }
      }

    }

    // return true;
    return true;
  }


  Future<bool> _launchInBrowser() async {
    print('projects_model.dart: ${projectLink}');
    Uri uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('contats_model.url, L58: External Browser rejected');
      return false;
    }

    return true;
  }

  Future<bool> _launchInWebView() async{
    Uri uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);


    if(!await launchUrl(uri,
        mode: LaunchMode.inAppWebView
    )){
      return false;
    }

    return true;
  }

}
