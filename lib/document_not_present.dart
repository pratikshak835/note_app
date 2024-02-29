import 'package:flutter/material.dart';

class DocumentNotPresent extends StatelessWidget {
  const DocumentNotPresent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
