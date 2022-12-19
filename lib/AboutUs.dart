import 'package:dyoevents20/Gallery.dart';
import 'package:flutter/material.dart';
import 'package:dyoevents20/LoginWidget.dart';
import 'package:dyoevents20/main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';



class AboutUs extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        title: Image.asset('assets/images/logo.png', height:100, width:100, fit: BoxFit.fitWidth),


      ),
    body: Column(
    children: [
    Container(
    height: 200,
    child: Image.asset('assets/images/logo.png',

    fit: BoxFit.fitWidth,
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    "Welcome to our company! We are a team of dedicated professionals committed to providing top-quality products and services. With over 20 years of experience in the industry, we have the knowledge and expertise to meet your needs. Thank you for considering us for your business.",
    style: TextStyle(
    fontSize: 18,
    color: Colors.black,
    ),
    ),
    ),
    Card(
    elevation: 5,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    children: [
    Text(
    "Our Mission",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child:Text(
      "At our company, our mission is to provide high-quality products and excellent customer service to all of our clients. We strive to exceed expectations and build long-lasting relationships with our customers. Whether you are a new or returning customer, we are here to assist you and ensure that you are completely satisfied with our products and services.",
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    bottomNavigationBar: Container(
    decoration: BoxDecoration(
    color: Colors.deepPurpleAccent,
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
    builder: (context) =>  AboutUs()),

    );
    },
    ),
    GButton(
    icon: LineIcons.photoVideo,
    text: 'Gallery',
    active: true,
    backgroundColor: Colors.deepPurple,
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