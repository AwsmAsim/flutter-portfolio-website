import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:portfolio_website1/constants.dart';
import 'package:portfolio_website1/screens/projects.dart';
import 'package:portfolio_website1/widgets/intoduction.dart';
import '../models/launch_resume.dart';
import '../widgets/dialog_box.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/navigator_tab.dart';
import 'about.dart';
import 'contact.dart';
import 'leetcode.dart';

class HomePage extends StatelessWidget {

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();


  List<Widget> pages = [
    Introduction(),
    About(),
    Leetcode(),
    Projects(),
    ContactPage(),
    SizedBox(height: 50.0,),
  ];

  List<String> tabNames = [
    "Introduction",
    "About",
    "Leetcode",
    "Projects",
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {

    final S_WIDTH = MediaQuery.of(context).size.width,
    S_HEIGHT = MediaQuery.of(context).size.height;

    return Scaffold(

      floatingActionButton: SizedBox(
        height:60,
        width:100,
        child:FloatingActionButton(
          backgroundColor: Colors.white, //child widget inside this button
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
          ),
          onPressed: () async{
            LaunchResume lr = LaunchResume();
            try{
              if(!await lr.launchLink()){
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
          child: const Text('Resume',
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: S_WIDTH > kMobileWidth ? null: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo_light.png')
                )
              ),
            ),
          ),
        ],
        toolbarHeight: 70.0,
      ),

      drawer: S_WIDTH > kMobileWidth ? null : Drawer(
        child: drawerColumn(context)
      ),
      body: Column(
        children: [
          S_WIDTH > kMobileWidth ? Expanded(
            flex: 1,
            child: MyNavigationBar(
              navigatorTabs: navigationBars(),
              logoUrl: 'images/logo_light.png',
            ),
          ): Container(),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index){
                  return pages[index];
                },
              ),
            ),
          )
        ],
      ),
    );
  }



  List<NavigatorTab> navigationBars(){
    List<NavigatorTab> navigationBarsList = [];
    for(int i = 0; i < tabNames.length; i++){
      var bar = NavigatorTab(
        name: tabNames[i],
        selected: false,
        onTap: (){
          itemScrollController.scrollTo(
              index: i,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic);
        },
      );
      navigationBarsList.add(bar);
    }

    return navigationBarsList;
  }

  Column drawerColumn(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: drawerTabs(context),
    );
  }


  List<Widget> drawerTabs(BuildContext context){
    List<Widget> panels = [];
    panels.add(
      Container(
        height: 100.0,
        width: 100.0,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/logo_light.png')
            )
        ),
      ),
    );

    for(int i = 0; i < tabNames.length; i++){
      var widget = GestureDetector(
        onTap: (){
          itemScrollController.scrollTo(
              index: i,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOutCubic);
          Navigator.pop(context);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(tabNames[i],
              style: const TextStyle(
                  fontSize: 15.0
              ),
            )
        ),
      );
      panels.add(widget);
    }
    return panels;
  }


}
