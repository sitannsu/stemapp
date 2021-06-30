import 'package:flutter/material.dart';
import 'package:stemapp/utils/ColorCode.dart';

import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  // final userCred;

  // const BottomNavScreen({Key key, this.userCred}) : super(key: key);
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  // declare variables...

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    HomeScreen(),
    Container(
      color: Colors.red,
      height: 300,
      width: 400,
    ),
    Container(
      color: Colors.red,
      height: 300,
      width: 400,
    ),
    Container(
      color: Colors.red,
      height: 300,
      width: 400,
    ),
  ];
  int _currentIndex = 0;

// method for change bottomIndex
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

// initialize thingies.....
  @override
  void initState() {
    super.initState();
  }

// disposing thingies....

  @override
  void dispose() {
    super.dispose();
    // show_Simple_Flushbar(context);
  }

  // ui parts starts from here...................

  @override
  Widget build(BuildContext context) {
    // var deviceSize = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(actions: [ RaisedButton(
        //               onPressed: (){
        //                 DynamicLinksService.createDynamicLink();

        //               },
        //               child: const Text('Get Short Link'),
        //             ),],),
        key: _scaffoldKey,

        // body parts .....

        body: _children[_currentIndex],

        //  bottom bar...............
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(ColorCode.PRIMARY_COLOR),
          unselectedItemColor: Color(ColorCode.UNSELECT_COLOUR),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          backgroundColor: Colors.white,
          elevation: 5,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.wine_bar_outlined),
              label: "Edutainment",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.more_horiz_rounded),
              label: "Flashcard",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.more_horiz_rounded),
              label: "Shop",
            ),
          ],
        ),
      ),
    );
  }
}
