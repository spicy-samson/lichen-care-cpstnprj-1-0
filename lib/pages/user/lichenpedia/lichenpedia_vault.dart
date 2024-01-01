import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class LichenPediaVault extends StatefulWidget {
  @override
  _LichenPediaVaultState createState() => _LichenPediaVaultState();
}

class VideoDetails {
  final String title;
  final DateTime uploadDate;
  final String uploader;
  final String thumbnailUrl;
  final String userId;
  final Timestamp timestamp;
  final String videoUrl;

  VideoDetails({
    required this.title,
    required this.uploadDate,
    required this.uploader,
    required this.thumbnailUrl,
    required this.userId,
    required this.timestamp,
    required this.videoUrl,
  });

  // Convert video details to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'uploadDate': uploadDate.toUtc(),
      'uploader': uploader,
      'thumbnailUrl': thumbnailUrl,
      'userId': userId,
      'timestamp': timestamp,
      'videoUrl': videoUrl,
    };
  }

  // Create a VideoDetails object from a Firestore document snapshot
  static VideoDetails fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return VideoDetails(
      title: data['title'],
      uploadDate: (data['uploadDate'] as Timestamp).toDate(),
      uploader: data['uploader'],
      thumbnailUrl: data['thumbnailUrl'],
      userId: data['userId'],
      timestamp: data['timestamp'],
      videoUrl: data['videoUrl'],
    );
  }
}

class _LichenPediaVaultState extends State<LichenPediaVault> {
  final int _currentIndex = 1;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double scaleFactor = h / 1080;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFF4E9),
        title: Padding(
          padding: EdgeInsets.only(top: h * 0.02, right: w * 0.42),
          child: SvgPicture.asset(
            'assets/svgs/#2 - lichenpedia.svg',
            width: w * 0.1,
            height: h * 0.6,
          ),
        ),
        elevation: 0,
        toolbarHeight: 80.0,
      ),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Video Vault',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                fontFamily: 'ABeeZee',
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  _showYoutubeLinkDialog(context, scaleFactor);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 160 * scaleFactor,
                        vertical: 22 * scaleFactor),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFF7F50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  'Add a Youtube Link',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            const SizedBox(height: 25),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('lichenpedia_video_vault')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    children: snapshot.data!.docs.map((doc) {
                      var videoDetails = VideoDetails.fromSnapshot(doc);
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchUrlString(videoDetails
                                  .videoUrl); // Launch the video URL
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    videoDetails.thumbnailUrl,
                                    width: 150,
                                    height: 84,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  videoDetails.title,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  // Add your delete logic here
                                                  _deleteVideoDetails(
                                                      videoDetails);
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            videoDetails.uploader,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('MMMM d, yyyy').format(
                                                videoDetails.uploadDate),
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20), // Add a SizedBox for spacing
                        ],
                      );
                    }).toList(),
                  );
                }
              },
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                      horizontal: 20, vertical: 22 * scaleFactor),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFF7F50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              child: const Text(
                'Go back',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),

      // Floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _lichenCheckBtn(context),

      // Bottom navigation ba()
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  // Function to show the AlertDialog
  void _showYoutubeLinkDialog(BuildContext context, double scaleFactor) {
    String youtubeLink = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter YouTube Link'),
          content: TextField(
            onChanged: (value) {
              youtubeLink = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter the YouTube link about Lichen Planus',
              hintStyle: TextStyle(fontSize: 16 * scaleFactor),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      // You can use the 'youtubeLink' variable here
                      await _fetchYoutubeVideoDetails(context, youtubeLink);
                      Navigator.of(context).pop();
                    },
              child: _isLoading
                  ? CircularProgressIndicator() // Show loading indicator
                  : Text('Add'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                      horizontal: 22 * scaleFactor, vertical: 18 * scaleFactor),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    _isLoading ? Colors.grey : const Color(0xFFFF7F50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteVideoDetails(VideoDetails videoDetails) async {
    try {
      await FirebaseFirestore.instance
          .collection('lichenpedia_video_vault')
          .doc(videoDetails.timestamp.toDate().toString())
          .delete();

      // You can update your UI or show a message after deletion
    } catch (e) {
      // Handle errors
      print('Error deleting video details: $e');
    }
  }

  // Function to fetch YouTube video details
  Future<void> _fetchYoutubeVideoDetails(
      BuildContext context, String youtubeLink) async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    User? user = FirebaseAuth.instance.currentUser;

    try {
      var yt = YoutubeExplode();
      var videoId = VideoId(youtubeLink).value;

      // Get video details
      var video = await yt.videos.get(videoId);

      // Extract video details
      var title = video.title;
      var uploadDate = video.uploadDate;
      var uploader = video.author;
      var thumbnailUrl = video.thumbnails.highResUrl;

      // Create a VideoDetails object
      var videoDetails = VideoDetails(
        title: title,
        uploadDate: uploadDate!.toUtc(),
        uploader: uploader,
        thumbnailUrl: thumbnailUrl,
        userId: user?.uid ?? '',
        timestamp: Timestamp.now(),
        videoUrl: youtubeLink,
      );

      // Add data to Firestore
      await FirebaseFirestore.instance
          .collection('lichenpedia_video_vault')
          .add(videoDetails.toMap());

      // You can update your UI with the fetched details here
    } catch (e) {
      // Handle errors
      print('Error fetching YouTube video details: $e');
    } finally {
      setState(() {
        _isLoading = false; // Set loading state back to false
      });
    }
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
            width: 32, // Set the width to adjust the size of the icon
            height: 32, // Set the height to adjust the size of the icon
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
          icon: Icon(
            Icons.home,
            size: 30,
            color: Color(0xFFFF7F50),
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
        // Handle navigation to different pages based on the index
        switch (index) {
          case 0:
            Navigator.of(context)
                .pushNamed('/home'); // Navigate to the 'home' route
            break;
          case 1:
            // Navigator.of(context).pushNamed(
            //     '/lichenpedia'); // Navigate to the 'lichenpedia' route
            break;
          case 2:
            Navigator.of(context).pushNamed(
                '/lichencheck'); // Navigate to the 'lichencheck' route
            break;
          case 3:
            Navigator.of(context)
                .pushNamed('/lichenHub'); // Navigate to the 'lichenhub' route
            break;
          case 4:
            Navigator.of(context)
                .pushNamed('/profile'); // Navigate to the 'profile' route
            break;
        }
      },
    );
  }
}

Widget _buildTextWithDivider(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          bottom: 6,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      if (text != 'Variants of Lichen Planus')
        const Divider(
          color: Colors.black,
        ),
    ],
  );
}
