import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home:HomePage(),));

class HomePage extends StatelessWidget {
  int selectedIndex=0;
  PageController pageController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation with PageView'),backgroundColor: Colors.blue,),
      // actions:[
      //   IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){

      // },)
      // ]
      body: Row(
        children: [
          NavigationRail(

            groupAlignment: -1,
            backgroundColor: Colors.blue,
            onDestinationSelected: (newIndex){
              // setState((){
              //   selectedIndex=newIndex;
              //   pageController.animateToPage(newIndex, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
              // });
            },
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedIndex: selectedIndex,
            destinations: [
              NavigationRailDestination(icon:Icon(Icons.home),label: Text('Home')),
              NavigationRailDestination(icon:Icon(Icons.call),label: Text('call')),
              NavigationRailDestination(icon:Icon(Icons.help),label: Text('info')),
            ],
          ),
          Expanded(child: PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: [
              Container(color: Colors.grey,),
              Container(color: Colors.indigo,),
              Container(color: Colors.red,),
            ],
          ),)
        ],
      ),
    );
  }
}











