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
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  final List<Image> _images = [];

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
        automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurpleAccent,
          title: Image.asset('assets/images/logo.png', height:100, width:100, fit: BoxFit.fitWidth),



      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: _images,
      ),
      bottomNavigationBar: Container(
<<<<<<< HEAD
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
=======
        decoration: const BoxDecoration(
          color: Colors.white,

>>>>>>> 747bde36fa86507c4c216a7b9d4bc48f94c6ad45
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
<<<<<<< HEAD

=======
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              backgroundColor: Colors.white,
>>>>>>> 747bde36fa86507c4c216a7b9d4bc48f94c6ad45
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  active: false,
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
                  active: false,
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
                  text: 'Gallery',
                  active: true,
                  backgroundColor: Colors.deepPurple!,
                  textColor: Colors.black,
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
