import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final DatabaseReference _feedbackRef =
      FirebaseDatabase.instance.reference().child('feedback');

  int _f1Rating = 0;
  int _f2Rating = 0;
  int _f3Rating = 0;
  int _f4Rating = 0;
  int _f5Rating = 0;

  void _submitFeedback() {
    _feedbackRef.push().set({
      'F1': _f1Rating.toString(),
      'F2': _f2Rating.toString(),
      'F3': _f3Rating.toString(),
      'F4': _f4Rating.toString(),
      'F5': _f5Rating.toString(),
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit feedback: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "Holistic Heal",
        style: TextStyle(
          // fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      elevation: 1,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      titleTextStyle: const TextStyle(color: Colors.green, fontSize: 26),
      centerTitle: true, // Align title text along the center
      // toolbarHeight: 65, // Increase the height of the AppBar
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Was the app easy to navigate?'),
            _buildRatingStar(_f1Rating, (rating) => _f1Rating = rating),
            SizedBox(height: 20),
            Text(
                'Were you able to easily find information about hospital specialties and services?'),
            _buildRatingStar(_f2Rating, (rating) => _f2Rating = rating),
            SizedBox(height: 20),
            Text('Did the app provide comprehensive coverage of hospitals in your area?'),
            _buildRatingStar(_f3Rating, (rating) => _f3Rating = rating),
            SizedBox(height: 20),
            Text('Did you experience any crashes or technical issues while using the app?'),
            _buildRatingStar(_f4Rating, (rating) => _f4Rating = rating),
            SizedBox(height: 20),
            Text('Are there any additional features you would like to see added to the app?'),
            _buildRatingStar(_f5Rating, (rating) => _f5Rating = rating),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStar(int rating, Function(int) onRatingChanged) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.orange,
          ),
          onPressed: () {
            setState(() {
              onRatingChanged(index + 1);
            });
          },
        );
      }),
    );
  }
}
