import 'package:flutter/material.dart';

class DocumentNotPresent extends StatelessWidget {
  const DocumentNotPresent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.7,
          image: AssetImage(
            'assets/slash_screen.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/empty_folder.png",
              width: 200,
              height: 200,
            ),
            const Text(
              "There are no files here yet",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
