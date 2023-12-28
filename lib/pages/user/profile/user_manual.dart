import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class UserManual extends StatefulWidget {
  _UserManualState createState() => _UserManualState();
}

class _UserManualState extends State<UserManual> {
  int _currentIndex = 4;
  bool navigatorHidden = false;

  Future download(String url, String filename) async {
    var savePath = '/storage/emulated/0/Download/$filename';
    var dio = Dio(BaseOptions(
      followRedirects: true,
    ));
    dio.interceptors.add(LogInterceptor());
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );
      var file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("File Downloaded"),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 2000),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error downloading file"),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 2000),
        ),
      );
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      debugPrint((received / total * 100).toStringAsFixed(0) + '%');
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double scaleFactor = h / 1080;

    return Scaffold(
      backgroundColor: Color(0xFFFFF4E9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFF4E9),
        title: Padding(
          padding: EdgeInsets.only(top: h * 0.02, right: w * 0.55),
          child: SvgPicture.asset(
            'assets/svgs/profileSection/profileAppBars/help.svg',
            width: w * 0.3,
            height: h * 0.95,
          ),
        ),
        elevation: 0,
        toolbarHeight: 60.0,
      ),

      // Body
      body: Listener(
          onPointerMove: (pointer) {
            // print(pointer.delta);
            if (pointer.delta.dy == 0) {
              return;
            }
            if (pointer.delta.dy < 0) {
              // scrolls down
              setState(() {
                navigatorHidden = true;
              });
            } else {
              // scrolls up
              setState(() {
                navigatorHidden = false;
              });
            }
          },
          child: Center(
            child: Column(
              children: [
                SizedBox(height: h * .05),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Center(
                      child: Text(
                    "Want to learn how to use the app properly?",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(height: h * .02),
                Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      "DOWNLOAD THE LICHENCARE USER MANUAL HERE",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(height: h * .03),
                ElevatedButton(
                  onPressed: () {
                    // Replace this URL with your actual PDF URL
                    String url =
                        'https://drive.google.com/uc?export=download&id=1MHBAHFXWtUDbEWfSRz0Kh-ke6f6khbrP';
                    var filename = 'LichenCare.pdf';
                    download(url, filename);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFF7F50)), // Background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            color: Colors.white,
                            width:
                                1.0), // Border color and width // Border radius
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Text color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  child: Text(
                    "Download PDF",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )),

      // Floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (navigatorHidden) ? null : _lichenCheckBtn(context),

      // Bottom navigation bar
      bottomNavigationBar: (navigatorHidden) ? null : _bottomNavBar(context),
    );
  }

  Container _lichenCheckBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the container a circle
        border: Border.all(
          color: const Color(0xFFFF7F50), // Set the border color
          width: 3.0, // Set the border width
        ),
      ),
      child: FloatingActionButton(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/lichenCheck');
          },
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/LichenCheck_icon.svg',
            width: 32,
            height: 32,
          ),
        ),
        backgroundColor: Color(0xFFFFF4E9),
        onPressed: () {},
      ),
    );
  }

  BottomNavigationBar _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF66D7D1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color.fromARGB(94, 0, 0, 0),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/Home_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/Lichenpedia_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'Lichenpedia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 32),
          label: 'LichenCheck',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/LichenHub_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'LichenHub',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/UserProfile_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/lichenpedia');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/lichenCheck');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/lichenHub');
            break;
          case 4:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
