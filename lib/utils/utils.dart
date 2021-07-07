import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stemapp/presenter/AppBarListener.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'dart:math';
import 'package:device_info/device_info.dart';


import 'ColorCode.dart';
import 'Strings.dart';
class Utils {

  /*
  * This method to call stateless widget screen.
  * */
  static void routeTransition(
      BuildContext context, StatelessWidget statelessWidget) {
    Navigator.of(context)
        .push(CupertinoPageRoute<Null>(builder: (BuildContext context) {
      return statelessWidget;
    }));
  }

  static void routeTransitionWithReplace(
      BuildContext context, StatelessWidget statelessWidget) {
//    Navigator.of(context).popAndPushNamed();
    Navigator. pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => statelessWidget,
      ),
    );
  }

  static void routeTransitionStateFullWithReplace(
      BuildContext context, StatefulWidget statefulWidget) {
//    Navigator.of(context).popAndPushNamed();
    Navigator. pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => statefulWidget,
      ),
    );
  }

  static void routeTransitionStateLess(
      BuildContext context, StatelessWidget statelessWidget) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<Null>(builder: (BuildContext context) {
      return statelessWidget;
    }), ModalRoute.withName("/Details"));
  }


  /*
  * This method to call stateful widget screen. Which will clear previous screen and will make new screen as parent.
  * */
  static void routeTransitionStateFull(
      BuildContext context, StatefulWidget statefulWidget) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<Null>(builder: (BuildContext context) {
      return statefulWidget;
    }), ModalRoute.withName("/Home"));
  }
/*
  * This method to call stateful widget screen. Which will not clear previous screen.
  * */


  /*void _getNetworkData() {
    Utils.getNetworkConnectedStatus().then((status) {
      setState(() {
        _isNetworkConnected = status;
        _isLoading = status;
        print(_isNetworkConnected);
        if (_isNetworkConnected) {
          _isLoading = true;
          *//*NetworkUtils.getNetWorkCall(
              Constant.IS_MOBILENUMBER_EXIST_URL + mobileController.text, this);*//*
        }
      });
    });
  }*/


  static void routeTransitionStateFullPush(
      BuildContext context, StatefulWidget statefulWidget) {
    Navigator.of(context)
        .push(CupertinoPageRoute<Null>(builder: (BuildContext context) {
      return statefulWidget;
    }));
//         MaterialPageRoute(builder: (BuildContext context) => statefulWidget));

//        MaterialPageRoute(builder: (BuildContext context) => statefulWidget),;
//           ModalRoute.withName('/'),
  }

//  static void _saveDeviceToken() async {
//    final Firestore _db = Firestore.instance;
//    final FirebaseMessaging _fcm = FirebaseMessaging();
//    // Get the current user
//    String uid = 'jeffd23';
//    // FirebaseUser user = await _auth.currentUser();
//
//    // Get the token for this device
//    String fcmToken = await _fcm.getToken();
//
//    // Save it to Firestore
//    if (fcmToken != null) {
//      var tokens = _db
//          .collection('users')
//          .document(uid)
//          .collection('tokens')
//          .document(fcmToken);
//
//      await tokens.setData({
//        'token': fcmToken,
//        'createdAt': FieldValue.serverTimestamp(), // optional
//        'platform': Platform.operatingSystem // optional
//      });
//    }
//  }

/*static void initOneSignal(){
  OneSignal.shared.init(
      "3dc9d248-181a-4022-aebe-f64a6d7f52f2",
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: true
      }
  );
   OneSignal.shared.consentGranted(true);
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
}*/
  static Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

 /* static void showAlertMessage(
      BuildContext context,
      String alertHeading,
      String alertMessage,
      String rightButtonText,
      String leftButtonText,
      AlertListener alertListener) {
    // Buttons Setup
    Widget cancelButton = FlatButton(
      child: Text(
        leftButtonText,
        style: getButtonBlackStyle(),
      ),
      onPressed: () {
//        leftButtonAction()
        alertListener.onLeftButtonAction(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        rightButtonText,
        style: getButtonBlackStyle(),
      ),
      onPressed: () {
//        rightButtonAction();
        //Navigator.of(context).pop(false);
        alertListener.onRightButtonAction(context);
      },
    );

    //Alert SetUp
    AlertDialog alert = AlertDialog(
      elevation: 10.0,
      title: alertHeading.isNotEmpty
          ? Text(
              alertHeading,
              style: getHeaderStyle(),
            )
          : null,
      content: Text(
        alertMessage,
        style: getSubTitleStyle(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // Alert Display
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/

  static showToast(String msg) {
      //FlutterToastr.show("Flutter Toastr is a Flutter package for non-blocking notifications", context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.bottom);
//     FlutterToastr.show(
//         msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         //timeInSecForIosWeb: 1,
// //        backgroundColor: Colors.grey,
//         textColor: Colors.black,
//         fontSize: 16.0);
  }

  /*static Widget buildSearchBar(
      BuildContext context,
      Widget appBarTitle,
      Icon icon,
      TextEditingController _controller,
      SearchOperationListener listener,
      State state) {
    print("called");
    */ /*Widget appBarTitle = new Text(
      searchTitle,
      style: new TextStyle(color: Colors.white),
    );
    Icon icon = new Icon(
      Icons.search,
      color: Colors.white,
    );*/ /*

    // final TextEditingController _controller = new TextEditingController();
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          print("on pressed called");
          // state.setState(() {
          if (icon.icon == Icons.search) {
            icon = new Icon(
              Icons.close,
              color: Colors.white,
            );
            appBarTitle = new TextField(
              controller: _controller,
              style: new TextStyle(
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search, color: Colors.white),
                  hintText: "Search...",
                  hintStyle: new TextStyle(color: Colors.white)),
              // onChanged: listener.onSearchText,
            );
            _handleSearchStart(state, listener);
          } else {
            _handleSearchEnd(icon, appBarTitle, _controller, state, listener);
          }
          // });
        },
      ),
    ]);
  }

  static void _handleSearchStart(
      State state, SearchOperationListener listener) {
    state.setState(() {
      print("search start called");
      // listener.onSearchStatus(true);
    });
  }

  static void _handleSearchEnd(
      Icon icon,
      Widget appBarTitle,
      TextEditingController _controller,
      State state,
      SearchOperationListener listener) {
    state.setState(() {
      icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      // listener.onSearchStatus(false);
      _controller.clear();
    });
    print("search end called");
  }*/

  /*static void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }*/
  /*static List<ServiceSubCategoryDetails> summaryList = [];

  static List<ServiceSubCategoryDetails> getSummaryList() {
    return summaryList;
  }

  static void setSummaryList(List<ServiceSubCategoryDetails> summaryLists) {
    summaryList = summaryLists;
  }
*/

  List drawerItems = [
    {
      "icon": Icons.add,
      "name": "Home Screen",
    },
    {
      "icon": Icons.delete,
      "name": "Details Screen",
    },
    {
      "icon": Icons.delete,
      "name": "Settings Screen",
    },
    {
      "icon": Icons.delete,
      "name": "Help Screen",
    },
  ];
  int _page = 0;
  String title = "Home Screen";


/*
  static ProgressHUD showProgressBar() {
    return new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.blue,
      borderRadius: 5.0,
      loading: false,
      text: 'Loading...',
    );
  }
*/

  static Widget showCircleProgressBar() {
    return Container(
        color: Colors.transparent,
        child: Center(
          child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
              )),
        ));
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }


  static double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  static double getProportionateScreenHeight(double inputHeight,BuildContext context) {
    double screenHeight = MediaQuery.of(context).size as double;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }


  static double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  static Widget showErrorMessage(BuildContext context) {
    if (context != null)
      return Center(
        child: Text("There is no data. Please try again later!",
            style: new TextStyle(fontSize: 18.0)),
      );
    return Container();
  }

  static Widget showNetworkErrorMessage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: Utils.screenHeight(context, dividedBy: 2.5)),
        child: Text(
            "There is no network connection in your device. Please check your connectivity & try again later!",
            style: new TextStyle(fontSize: 18.0)));
  }

  static bool isConnected = false;

  static Future<bool> getNetworkConnectedStatus() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnected = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      isConnected = false;
    }
    return isConnected;
  }

  static bool isNetworkConnected() {
    return isConnected;
  }

  static bool isBackPressed = false, isSummaryLoggedOut = false;

  static void setBackPressed(bool backpressed) {
    isBackPressed = backpressed;
  }

  static bool getBackPressed() {
    return isBackPressed;
  }

  static void setSummaryLoggedOut(bool isLoggedOut) {
    isSummaryLoggedOut = isLoggedOut;
  }

  static void printLog(String message) {
              print(message);
  }

  static Widget showErrorDialog(BuildContext context, String? title) {
     showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              Strings.APP_NAME_TEXT,
              style: getHeaderStyle(),
            ),
            content: new Text(title!),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  Strings.OK_TEXT,
                  style: getButtonBlackStyle(),
                ),
              ),
            ],
          ),
        );
     return Container();

  }

  static int serviceMainId = 0;

  static void setBookedServiceId(int serviceMainIds) {
    serviceMainId = serviceMainIds;
  }

  static TextStyle getTitleWhiteStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 20.0,
      color: Colors.white,
    );
  }

  static TextStyle getActionbarHeaderStyle() {
    return TextStyle(
      fontFamily: 'Arial',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,

      color: Colors.white,
    );
  }

  static TextStyle getHeaderStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Regular',
      fontSize: 18.0,
      color: Colors.black87,
    );
  }
static TextStyle getTextColorStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Regular',
      fontSize: 18.0,
       color: Color(ColorCode.TEXT_COLOR),
    );
  }

  static TextStyle getHeaderWhiteStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Regular',
      fontSize: 18.0,
      color: Colors.white,
    );
  }
 static TextStyle getHeaderPrimaryStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Regular',
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.16,

      color: Color(ColorCode.PRIMARY_COLOR),
    );
  }


  static TextStyle getSubTitleStyle() {
    return TextStyle(
      fontFamily: 'Arial',
      fontSize: 16.0,
      letterSpacing: 0.16,

      color: Colors.blueGrey,
    );
  }
 static TextStyle getTitleStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Light',
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      //fontSize: 14,
      letterSpacing: 0.16,
      color: Colors.black54,

    );
  }
  static TextStyle getTextBlackStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.18,

      color: Colors.black87,
    );
  }



  static TextStyle getButtonWhiteStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 18.0,
      color: Colors.white,
    );
  }

  static TextStyle getLabelPrimaryStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 14.0,
      color: Color(ColorCode.PRIMARY_COLOR),
    );
  }
  static TextStyle getLabelWhiteStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 16.0,
      color: Colors.white,
    );
  }
  static TextStyle getLabelSmallStyle() {
    return TextStyle(
      fontFamily: 'Arial-Semibold',
      fontSize: 14.0,
      fontWeight: FontWeight.w800,
      color: Colors.blueGrey,
    );
  }

  static TextStyle getButtonBlackStyle() {
    return TextStyle(
      fontFamily: 'OpenSans-Semibold',
      fontSize: 18.0,
      color: Colors.black87,
    );
  }


  static onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

/*  static Future<void> share(String title, String shareText, String url, String chooserTitle) async {
    await FlutterShare.share(
        title: title,
        text: shareText,
        linkUrl: url,
        chooserTitle: chooserTitle);
  }*/

  static Widget getAppBarWithoutBackButton(String title, BuildContext context) {
    return new AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      centerTitle: true,
      elevation: 2.0,
      title: new Text(
        title,
        style: Utils.getTitleWhiteStyle()
            .copyWith(color: Colors.white, fontSize: 18),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget getAppBar(String title, BuildContext context) {
    return new AppBar(
//        gradient: LinearGradient(colors: [Color(ColorCode.HEADER_LEFT_COLOUR), Color(ColorCode.HEADER_RIGHT_COLOUR)]),
        automaticallyImplyLeading: true,
        titleSpacing: 0.0,
        centerTitle: true,
        elevation: 2.0,
        title: new Text(
          title.replaceAll("*", ""),
          style: Utils.getTitleWhiteStyle()
              .copyWith(color: Colors.white, fontSize: 18),
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ));
  }

  static Widget getAppBarWithSaveButton(
      String title, BuildContext context, AppBarListener listener) {
    return AppBar(
      automaticallyImplyLeading: true,
      titleSpacing: 0.0,
      centerTitle: true,
      elevation: 2.0,
      title: new Text(
        title.replaceAll("*", ""),
        style: Utils.getTitleWhiteStyle()
            .copyWith(color: Colors.white, fontSize: 18),
        overflow: TextOverflow.ellipsis,
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => listener.onBackPress(), //Navigator.pop(context),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 2.0),
            child: FlatButton(
//                  color: Color(ColorCode.PRIMARY_COLOR),
              onPressed: () {
                listener.onClicked();
//                listener.onSingleSelect(_gridList, title);
//                Navigator.pop(context);
              },
              child: Text(
                Strings.SAVE_BTN_TEXT,
                style: Utils.getHeaderStyle().copyWith(color: Colors.white),
              ),
            )),
      ],
    );
  }
static Widget getAppBarWithRightButton(
      String title, BuildContext context, AppBarListener listener, String buttonTitle) {
    return AppBar(
      automaticallyImplyLeading: true,
      titleSpacing: 0.0,
      centerTitle: true,
      elevation: 2.0,
      title: new Text(
        title.replaceAll("*", ""),
        style: Utils.getTitleWhiteStyle()
            .copyWith(color: Colors.white, fontSize: 18),
        overflow: TextOverflow.ellipsis,
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => listener.onBackPress(), //Navigator.pop(context),
      ),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 2.0),
            child: FlatButton(
//                  color: Color(ColorCode.PRIMARY_COLOR),
              onPressed: () {
               listener.onClicked();
//                listener.onSingleSelect(_gridList, title);
//                Navigator.pop(context);
              },
              child: Text(
                buttonTitle,
                style: Utils.getHeaderStyle().copyWith(color: Colors.white),
              ),
            )),
      ],
    );
  }

  static String getYear(
      BuildContext context, TextEditingController controller) {
     showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: _datetime(context, controller),
          );
        });
     return "";
  }

  static Widget _datetime(
      BuildContext context, TextEditingController controller) {
    List? dateList;
    if (controller != null && controller.text.length > 0) {
      dateList = controller.text.split("/");
    }
    return CupertinoDatePicker(
      initialDateTime: (dateList != null && dateList.length > 0)
          ? DateTime(int.parse(dateList[2]), int.parse(dateList[0]),
              int.parse(dateList[1]))
          : DateTime(
              1970,
              1,
            ),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
        (context as Element).markNeedsBuild();
        controller.text = "${newdate.month}/${newdate.day}/${newdate.year}";
      },
      use24hFormat: true,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.date,
//      mode: CupertinoExtended.CupertinoDatePickerMode.date,
    );
  }

  // static final DateFormat formatter = DateFormat('MMMM, yyyy');
  //
  // static DateFormat getDateFormat(String format) {
  //   return DateFormat(format);
  // }
  static var toDateError = null;


  static String mobileNumberValidator(var value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return Strings.ENTER_VALID_PHONE_NUMBER;
    } else if (value!.length != 10) {
      return Strings.ENTER_VALID_PHONE_NUMBER;
    } else if (!regExp.hasMatch(value!)) {
      return Strings.ENTER_VALID_PHONE_NUMBER;
    }else {
      return value;
    }
  }



  static Widget createDrawerHeader(String mName,String phone) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('images/drawer_header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.account_circle,size:36.0,color: Colors.white),

                  Row(
                    children: [
                      Text(mName,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500),),
                          SizedBox(width: 5.0,),
                          Text(phone,
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              )
          ),

        ]));
  }

  static Widget createDrawerBodyItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon,color: Color(ColorCode.PRIMARY_COLOR)),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  /*
  * Used to get auth token
  * */


  static DateTime getUTCTime(DateTime? now){

      return DateTime(now!.year, now.month, now.day).toUtc();
  }

  static DateTime getLocalTime(DateTime? utcTime){
      return utcTime!.toLocal();
  }

  static double roundDouble(double? value, int? places){
    num mod = pow(10.0, places!);
    return ((value! * mod).round().toDouble() / mod);
  }

  static double getReviewPercent(int value, int totalCount){
    return (totalCount >0)?(value/totalCount):0;
  }
 /* static ClinicDashboardData _dashboardData;
  static ClinicDashboardData getClinicDashboard(){
    return _dashboardData;
  }
  static void setClinicDashBoard(ClinicDashboardData _dashboardDatas){
    _dashboardData = _dashboardDatas;
  }*/
}
