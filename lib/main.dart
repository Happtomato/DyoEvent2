import 'package:dyoevents20/AboutUs.dart';
import 'package:dyoevents20/Gallery.dart';
import 'package:dyoevents20/LoginWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Dyoevents',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(title: 'Dyoevents'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 300.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                    child: Text('In einem Team von drei Leuten organisieren wir seit Januar 2022 Events in Clubs und Waldhäusern. Angefangen hat es im Waldhaus Staufen mit ungefähr 30 Teilnehmern. Inzwischen sind wir bereits 80 und haben zuletzt im Flösserplatz Aarau gefeiert. Wir freuen uns, in Zukunft weitere Partys an den verschiedensten Orten zu schmeissen.')
                )
              ],
            ),
          ),
        ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
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
