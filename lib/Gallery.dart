import 'package:dyoevents20/AboutUs.dart';
import 'package:dyoevents20/LoginWidget.dart';
import 'package:dyoevents20/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  _galleryState createState() => _galleryState();
}

class _galleryState extends State<Gallery> {

  List<Image> _images = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  void loadImages() async {
    // Access the Firebase storage
    var storage = FirebaseStorage.instance;
    // Get a reference to the folder where your pictures are stored
    var ref = storage.ref().child('/PartyPictures');
    // Get the list of files in the folder
    var files = await ref.listAll();
    // Loop through the files and download each one
    for (var file in files.items) {
      print(file.name);
      var downloadUrl = await file.getDownloadURL();
      // Use the download URL to create an Image widget
      var image = Image.network(downloadUrl);
      // Add the image to the list of images
        _images.add(image);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _images,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.purple[300]!,
              hoverColor: Colors.purple[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              backgroundColor: Colors.grey,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp()),
                    );
                  },
                ),
                GButton(
                  icon: LineIcons.infoCircle,
                  text: 'About Us',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutUs()),
                    );
                  },
                ),
                GButton(
                  icon: LineIcons.photoVideo,
                  text: 'Events',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Gallery()),
                    );
                  },
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWidget()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StorageService {
  static Future<String> getDownloadURL(String path) async {
    return await FirebaseStorage.instance.ref(path).getDownloadURL();
  }
}
