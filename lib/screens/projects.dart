import 'dart:html';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../controller/project_controller.dart';
import '../widgets/dialog_box.dart';

class Projects extends StatelessWidget {
  final projectsController = ProjectController();

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
                color: Color(0xffd9d9d9), blurRadius: 5.0, offset: Offset(10, 10)
                // blurStyle: BlurStyle.solid
                ),
            BoxShadow(
                color: Color(0xffd9d9d9), blurRadius: 5.0, offset: Offset(10, 10)
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
                'Projects',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              projectsPanel(S_WIDTH, context),
            ],
          ),
        ),
      ),
    );
  }



  Widget projectsPanel(double width, BuildContext context) {
    List<Widget> lst = [];
    for (var project in projectsController.projectsList) {
      var panel = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: width > kMobileWidth
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async{
                      try{
                        if(!await project.launchLink()){
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
                    child: Column(
                      children: [
                        // Title
                        Row(
                          children: [
                            Text(
                              project.projectName,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            const Icon(Icons.link,
                              size: 20.0,
                            )
                          ],
                        ),

                        // Image
                        Container(
                          width:
                              width > kTabletWidth ? kTabletWidth / 5 : width / 5,
                          height:
                              width > kTabletWidth ? kTabletWidth / 5 : width / 5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(project.imageLink),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 5,
                    decoration: BoxDecoration(color: Colors.white),
                    // height: double.infinity,
                  ),
                  Container(
                    width: 3 * (width / 5),
                    child: Text(project.projectDescription),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async{
                      try{
                        if(!await project.launchLink()){
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
                    child: Column(
                      children: [
                        // title
                        Row(
                          children: [
                            Text(
                              project.projectName,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const Icon(Icons.link,
                              size: 20.0,
                            )
                          ],
                        ),

                        const SizedBox(height: 5.0,),

                        // image
                        Container(
                          width: width / 5,
                          height: width / 5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(project.imageLink),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  // Description
                  Container(
                    padding: EdgeInsets.all(5.0),
                    // width: 3 * (width / 5),
                    child: Text(project.projectDescription),
                  ),
                ],
              ),
      );
      lst.add(panel);
    }
    return Column(
      children: lst,
    );
  }
}
