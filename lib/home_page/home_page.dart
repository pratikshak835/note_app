import 'package:flutter/material.dart';
import 'package:notes_app/b.pharmacy_page/b.pharmacy_page.dart';
import 'package:notes_app/home_page/about_us_page.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final screen = [
    const Center(
      child: Text("home"),
    )
  ];

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void>? launched;
  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://youtube.com/@rdpharma?si=OCM1GucKE1ZGagon';
    const String toLaunchTelegram = 'https://t.me/pharmacystudentfamily';
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
        ),
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text("Classroom",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  image: DecorationImage(
                    image: AssetImage('assets/app_logo-removebg-preview.png'),
                  ),
                ),
                child: Text("")),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Home'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      'assets/share.png',
                    ),
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Share App'),
                ],
              ),
              onTap: () {
                Share.share('....');
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star_half_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Rate Us'),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('About Us'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUSPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('assets/slash_screen.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BPharmacyPage()),
                    );
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.library_books,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "B.Pharmacy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      launched = _launchInBrowser(toLaunch);
                    });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Watch Lectures",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      launched = _launchInBrowser(toLaunchTelegram);
                    });
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.telegram_sharp,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Join Telegram Channel",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // SizedBox(
              //   width: 300,
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SettingPage()),
              //       );
              //     },
              //     style: ButtonStyle(
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(
              //                 8.0), // Adjust the radius as needed
              //           ),
              //         ),
              //         backgroundColor: MaterialStateProperty.all(Colors.amberAccent)),
              //     child: const Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Column(
              //         children: [
              //           Icon(
              //             Icons.info_outline_rounded,
              //             color: Colors.white,
              //             size: 40,
              //           ),
              //           SizedBox(
              //             height: 8,
              //           ),
              //           Text(
              //             "About us",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 20),
              //             textAlign: TextAlign.center,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.amberAccent,
      //   currentIndex: _selectedIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.settings,
      //       ),
      //       label: 'Setting',
      //     ),
      //   ],
      //   selectedItemColor: Colors.white,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
