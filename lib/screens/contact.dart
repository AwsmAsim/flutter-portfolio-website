import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website1/controller/contacts_controller.dart';

import '../constants.dart';
import '../widgets/dialog_box.dart';

class ContactPage extends StatelessWidget {
  final contactsController = ContactsController();

  @override
  Widget build(BuildContext context) {

    final double S_HEIGHT = MediaQuery.of(context).size.height,
        S_WIDTH = MediaQuery.of(context).size.width;

    double fontSizeReduction =
    S_WIDTH > kMobileWidth ? 0 : kMobileFontSizeReduction;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                colors: [Color(0xffe6e6e6), Colors.white70, Color(0xffffffff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffd9d9d9),
                  blurRadius: 5.0,
                  offset: Offset(10, 10)
                // blurStyle: BlurStyle.solid
              ),
              BoxShadow(
                  color: Color(0xffffffff),
                  blurRadius: 5.0,
                  offset: Offset(-10, -10)
                // blurStyle: BlurStyle.solid
              )
            ],
        ),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                color: Colors.white,
                width: 3.0,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Contact',
                style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Container(
                width: double.infinity,
                height: S_WIDTH > kMobileWidth ? 300 : 300,
                child: GridView.builder(
                    itemCount: contactsController.contactsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: S_WIDTH > kTabletWidth ? 6: S_WIDTH > kMobileWidth ? 2 : 1,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: () async{
                          try{
                            if(!await contactsController.contactsList[index].launchLink()){
                              DialogUtils.showCustomDialog(context,
                                title: "Sorry Some error occured",
                                okBtnText: "Ok",
                                okBtnFunction: () {},
                              );
                          }
                          }catch(e){
                            DialogUtils.showCustomDialog(context,
                              title: "Sorry Some error occured",
                              okBtnText: "Ok",
                              okBtnFunction: () {},
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(contactsController.contactsList[index].platformName,
                                      style: const TextStyle(
                                        fontSize: 25.0
                                      ),
                                    ),
                                    const Icon(Icons.link,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                                Image.asset(contactsController.contactsList[index].platformLogoLink,
                                  height: 150,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
