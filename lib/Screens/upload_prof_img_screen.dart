import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:stemapp/core/constants/ColorCode.dart';
import 'package:stemapp/datasource/remote/remote_datasource.dart';
import 'package:stemapp/utils/utils.dart';



class UploadProfImgScreen extends StatefulWidget {
  const UploadProfImgScreen() : super();

  @override
  _UploadProfImgScreenState createState() => _UploadProfImgScreenState();
}

class _UploadProfImgScreenState extends State<UploadProfImgScreen> {
  PickedFile? cameraFile;
  Future<void> getLocalImage() async {
    var _galleryFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      // cameraFile = _galleryFile;
      if (_galleryFile != null) {
        cameraFile = PickedFile(_galleryFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(ColorCode.PRIMARY_COLOR),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceSize.height / 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: Utils.getHeaderPrimaryStyle().copyWith(fontSize: 35),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "To the world of gappu and baba",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Help us setup you account! \nplease uplaod a beautiful picture of yours \nto setup your profile!",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(
              height: deviceSize.height / 8,
            ),

            GestureDetector(
              onTap: (){
                getLocalImage().then((value) {
                  RemoteDatasource().uploadProfile();
                });
              },
              child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.orangeAccent,
                  child: cameraFile != null? CircleAvatar(
                    radius: 62,
                    backgroundImage:FileImage(File(cameraFile!.path)),
                  ):Image.asset('assets/images/king.png'),
              ),
            ),

            // cameraFile != null
            //     ? CircleAvatar(
            //         radius: 65,
            //         backgroundColor: Colors.orangeAccent,
            //         child: CircleAvatar(
            //           radius: 62,
            //           backgroundImage: FileImage(File(cameraFile!.path)),
            //         ))
            //
            //     : Container(
            //         color: Colors.white,
            //         width: deviceSize.width,
            //         height: 1,
            //         child: Icon(
            //           Icons.person,
            //           size: 50,
            //         ),
            //       ),
            SizedBox(
              height: deviceSize.height / 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceSize.width / 9),
              child: uploadbtn(
                widget: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "Upload Profile Image",
                    style: Utils.getHeaderWhiteStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(right: 50, left: deviceSize.width / 2),
                child: uploadbtn(
                  widget: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () async {
                          print("object");
                          if (cameraFile != null) {
                            RemoteDatasource()
                                .userProfilePhotoUpdate(imgFile: cameraFile);
                          } else {
                            print("add image");
                          }
                        },
                        label: Text(
                          "Next",
                          style: Utils.getHeaderWhiteStyle(),
                          textAlign: TextAlign.center,
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget uploadbtn({required Widget widget}) {
    return GestureDetector(
      onTap: () {
        // getLocalImage().then((value) {
        //   RemoteDatasource().uploadProfile();
        // });
        if (cameraFile != null) {
          RemoteDatasource()
              .userProfilePhotoUpdate(imgFile: cameraFile);
        } else {
          print("add image");
        }
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
        // Utils.routeTransitionStateFullPush(context, welcomescreen());
        FormData formData = new FormData.fromMap({
          "name": "wendux",
          //"file_name": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
        });
      },
      child: Container(
        // width: 121,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          // icon: Icons.arrow_forward_ios,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                offset: Offset(0, 5),
                blurRadius: 5)
          ],
          color: Color(ColorCode.BTN_COLOUR),
        ),
        child: Center(child: widget
            //Text("Enter",style:Utils.getHeaderWhiteStyle())

            ),
      ),
    );
  }
}
