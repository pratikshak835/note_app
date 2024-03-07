import 'package:flutter/material.dart';

class AboutUSPage extends StatelessWidget {
  const AboutUSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          shape: ContinuousRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust the radius as needed
          ),
          backgroundColor: Colors.teal,
          title: const Text("About Us",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
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
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.0, right: 32, left: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/app_logo-removebg-preview.png'),
                    height: 150,
                    width: 150,
                  ),
                  Text(
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      "Welcome to Learn Pharmacy, your go-to destination for unlocking the world of pharmaceutical knowledge! Our app is designed to empower students, professionals, and enthusiasts alike, providing comprehensive resources and insightful content to enhance your understanding of pharmacy."),
                  Text(
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      "Learn Pharmacy is your gateway to success. Join our community today and embark on a transformative journey towards mastering the art and science of pharmacy!"),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      "If you have any queries regarding your subject and have any problem in downloading contact us on mail"),
                  Text(
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ""),
                ],
              ),
            ),
          ),
        ));
  }
}
