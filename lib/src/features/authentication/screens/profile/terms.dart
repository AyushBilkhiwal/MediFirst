import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'By using MediFirst, you agree to comply with and be bound by these terms and conditions. If you do not agree to these terms, please do not use the application.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more sections as needed

            SizedBox(height: 20.0),

            Text(
              '10. Contact Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have any questions about these terms and conditions, please contact us at bilkhiwalayush@gmail.com.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),

            Text(
              'Date of Last Update: 27/1/24',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

