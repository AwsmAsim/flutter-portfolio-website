import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website1/constants.dart';
import 'dart:js' as js;

class ContactsModel {
  final String platformName, scheme, platformLogoLink, contactUrl;


  // Contact model contains the platform name which is necessary.
  // eg: LinkedIN, E-Mail etc

  // platform Logo Link contains the image of the platform

  // ContactUrl contains the url or mail id or even the phone number if further added.

  // schemes are defined in the constants.dart
  ContactsModel(
      {required this.platformName,
      required this.scheme,
      this.platformLogoLink = "",
      this.contactUrl = ""});



  Future<bool> launchLink() async {

    Uri uri = Uri(scheme: scheme, path: contactUrl);
    bool ableToLaunch = true;
    await canLaunchUrl(uri).then((bool result) {
      ableToLaunch = result;
    });

    // print('contacts_model.dart, L31: Not able to launch');

    if (!ableToLaunch) return false;

    if (scheme == WEB) {
      // First we will try to launch it in Web View, if it fails, we will hen proceed to external browser
      if(kIsWeb){
        print(uri.toString());
        await launchUrl(Uri.parse('https://' + contactUrl));
        // js.context.callMethod('open', [uri.toString()]);
      }else{
        if(!await _launchInWebView()){
          if(!await _launchInBrowser()){
            return false;
          }
        }
      }
      // return true;
    } else if (scheme == MAIL) {

      // Send a simple mail
      if(!await _sendEMail()){
        return false;
      }
    }
    return true;
  }


  Future<bool> _launchInBrowser() async {
    Uri uri = Uri(scheme: scheme, path: contactUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('contats_model.url, L58: External Browser rejected');
      return false;
    }

    return true;
  }

  Future<bool> _launchInWebView() async{
    Uri uri = Uri(scheme: scheme, path: contactUrl);

    if(!await launchUrl(uri,
      mode: LaunchMode.inAppWebView
    )){
      return false;
    }

    return true;
  }

  Future<bool> _sendEMail() async{
    final Uri launchUri = Uri(
      scheme: scheme,
      path: contactUrl,
    );
    if(!await launchUrl(launchUri)){
      return false;
    }
    return true;
  }
}
