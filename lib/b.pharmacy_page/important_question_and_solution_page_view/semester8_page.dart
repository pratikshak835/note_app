import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/home_page/document_not_present.dart';
import 'package:notes_app/pdf_viewer_screen/PdfViewerScreen.dart';

class QuestionsSemester8Page extends StatefulWidget {
  const QuestionsSemester8Page({Key? key}) : super(key: key);

  @override
  State<QuestionsSemester8Page> createState() => _QuestionsSemester8Page();
}

class _QuestionsSemester8Page extends State<QuestionsSemester8Page> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  Future<String> uploadPdf(String fileName, File file) async {
    final reference =
        FirebaseStorage.instance.ref().child("Qsemester8 / $fileName.pdf");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

  bool isResponse = false;

  void pickFile() async {
    final pickedFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    setState(() {
      isResponse = true;
    });

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await uploadPdf(fileName, file);
      _firebaseFirestore.collection("Qsemester8").add({
        "name": fileName,
        "url": downloadLink,
      });

      debugPrint("Pdf uploaded successfully");
      getAllPdf();
    }
  }

  void getAllPdf() async {
    final results = await _firebaseFirestore.collection("Qsemester8").get();
    pdfData = results.docs.map((e) => e.data()).toList();
    setState(() {
      isResponse = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isResponse = true;
    getAllPdf();
  }

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
        title: const Text("Semester 8",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white)),
      ),
      body: isResponse
          ? Container(
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
                child: Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.0),
                        border:
                            Border.all(color: Colors.transparent, width: 1)),
                    child: const MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CircularProgressIndicator(),
                    )),
              ),
            )
          : pdfData.isEmpty
              ? const DocumentNotPresent()
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.7,
                      image: AssetImage('assets/slash_screen.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: pdfData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        isResponse = false;
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PdfViewerScreen(
                                      pdfUrl: pdfData[index]['url'],
                                    )));
                          },
                          child: Card(
                            color: Colors.teal,
                            child: GridTile(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/pdf.png",
                                        width: 140,
                                        height: 80,
                                      ),
                                      Text(
                                        pdfData[index]['name'],
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )), //just for testing, will fill with image later
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickFile,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.upload_file),
      ),
    );
  }
}
