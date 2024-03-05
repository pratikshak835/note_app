import 'package:flutter/material.dart';
import 'package:notes_app/b.pharmacy_page/b.pharmacy_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final screen = [
    const Center(
      child: Text("home"),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    //Below link change regarding to video
    const String toLaunch = 'https://youtube.com/@rdpharma?si=OCM1GucKE1ZGagon';
    const String toLaunchTelegram = 'https://t.me/pharmacystudentfamily';
    return Scaffold(
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
      ),
      body: Center(
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
            //         backgroundColor: MaterialStateProperty.all(Colors.teal)),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Setting',
          ),
        ],
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
