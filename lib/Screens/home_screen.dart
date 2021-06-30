import 'package:flutter/material.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Color(ColorCode.PRIMARY_COLOR),
        // title: Text("okay"),
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              // _scaffoldKey.currentState.openDrawer();
            }),
        actions: [
          // IconButton(
          //     icon: Icon(
          //       Icons.sort,
          //       size: 30,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       // _scaffoldKey.currentState.openDrawer();
          //     }),
          IconButton(
              icon: Icon(
                Icons.star,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                // _scaffoldKey.currentState.openDrawer();
              }),
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                // _scaffoldKey.currentState.openDrawer();
              }),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: deviceSize.width,
                decoration: BoxDecoration(
                    color: Color(ColorCode.PRIMARY_COLOR),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome!",
                            style: Utils.getActionbarHeaderStyle()
                                .copyWith(fontSize: 35),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Aditi",
                            style: Utils.getActionbarHeaderStyle()
                                .copyWith(fontSize: 22),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Good Morning",
                            style: Utils.getActionbarHeaderStyle()
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.red,
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage(""),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "search a friend",
                              suffixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(

                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide.none)
                              //borderSide: const BorderSide(),
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Your latest posts performance",
                      style: Utils.getHeaderStyle().copyWith(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 1,
                      child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Density",
                                    style: Utils.getHeaderStyle().copyWith(),
                                    textAlign: TextAlign.start,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "posted on 25-09-21",
                                        style: Utils.getTitleStyle(),
                                        textAlign: TextAlign.start,
                                      ),
                                      Row(
                                        children: List.generate(
                                            3,
                                            (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.pink[50],
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Image.asset(
                                    "assets/images/icon.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                                  style: Utils.getLabelSmallStyle(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
