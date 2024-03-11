import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> _feedbackList = [];
  int _rating = 0;
  TextEditingController _feedbackController = TextEditingController();

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  bool _isSubmitDisabled() {
    return _feedbackController.text.isEmpty;
  }

  void _submitFeedback() async {
    try {
      // Store feedback entry
      final newFeedback = {
        'rating': _rating,
        'feedback': _feedbackController.text
      };
      _feedbackList.add(newFeedback);

      // Store feedback list in local storage
      final prefs = await SharedPreferences.getInstance();
      final encodedFeedbackList =
          _feedbackList.map((entry) => entry.toString()).toList();
      await prefs.setStringList('feedbackList', encodedFeedbackList);

      // Clear the feedback text field
      _feedbackController.clear();

      // Reset the rating to zero
      _setRating(0);

      // Show dialog indicating successful submission
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Feedback Submitted'),
            content: const Text('Thank you for your feedback!'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle errors
      debugPrint('Error submitting feedback: $e');
    }
  }

  @override
  void initState() {
    _loadFeedbackList();
    super.initState();
  }

  Future<void> _loadFeedbackList() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedFeedbackList = prefs.getStringList('feedbackList');
    if (encodedFeedbackList != null) {
      _feedbackList = encodedFeedbackList
          .map((entry) => _decodeFeedbackEntry(entry))
          .toList();
    }
  }

  Map<String, dynamic> _decodeFeedbackEntry(String entry) {
    // Decode the JSON string into a Map<String, dynamic> object
    return Map<String, dynamic>.from(json.decode(entry));
  }

  @override
  void dispose() {
    // Clean up the TextEditingController when the widget is disposed
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
        // FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text("Feedback",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.3,
              image: AssetImage('assets/slash_screen.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image(
                        image: AssetImage(
                          'assets/app_logo-removebg-preview.png',
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Your Feedback',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    focusNode: _focusNode,
                    controller: _feedbackController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your feedback here',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Rate Us',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 5; i++)
                        GestureDetector(
                          onTap: () => _setRating(i),
                          child: Icon(
                            size: 40,
                            i <= _rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: _isSubmitDisabled()
                              ? MaterialStateProperty.all(
                                  Colors.teal.withOpacity(0.3))
                              : MaterialStateProperty.all(Colors.teal)),
                      onPressed: _isSubmitDisabled() ? null : _submitFeedback,
                      child: const Text(
                        'Submit Feedback',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  //stored feedback
                  /*const SizedBox(height: 16.0),
                  const Text(
                    'Stored Feedback:',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: _feedbackList.length,
                      itemBuilder: (context, index) {
                        final feedbackEntry = _feedbackList[index];
                        return ListTile(
                          title: Text('Rating: ${feedbackEntry['rating']}'),
                          subtitle:
                              Text('Feedback: ${feedbackEntry['feedback']}'),
                        );
                      },
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
