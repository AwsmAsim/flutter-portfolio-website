import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

import '../constants.dart';

class ProjectModel{

  String projectName, projectDescription, imageLink, projectLink;
  String scheme = 'https';
  Map<String, dynamic>? queryParameters;

  ProjectModel({
    required this.projectName,
    required this.projectDescription,
    required this.imageLink,
    required this.projectLink,
    this.queryParameters
  });



  Future<bool> launchLink() async {

    Uri uri = Uri(scheme: scheme, path: "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b" + projectLink);
    if(queryParameters!=null){
      uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);
    }
    bool ableToLaunch = true;
    await canLaunchUrl(uri).then((bool result) {
      ableToLaunch = result;
    });

    print('projects_model.dart, L31: Not able to launch');

    if (!ableToLaunch) return false;

      // First we will try to launch it in Web View, if it fails, we will hen proceed to external browser
    if(kIsWeb){
      print(uri.toString());
      js.context.callMethod('open', [uri.toString()]);
    }else{
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
    Uri uri = Uri(scheme: scheme, path: this.projectLink);
    if(queryParameters!=null){
      uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('contats_model.url, L58: External Browser rejected');
      return false;
    }

    return true;
  }

  Future<bool> _launchInWebView() async{
    Uri uri = Uri(scheme: scheme, path: this.projectLink);
    if(queryParameters!=null){
      uri = Uri(scheme: scheme, path: projectLink, queryParameters: queryParameters);
    }

    if(!await launchUrl(uri,
        mode: LaunchMode.inAppWebView
    )){
      return false;
    }

    return true;
  }

}