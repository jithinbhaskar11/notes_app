import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. Information We Don't Collect",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                'We want to be transparent about the information we do not collect:\n'
                    " We do not collect personal identification information.\n"
              "We do not collect any personally identifiable information about you",
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),
              Divider(height: 30,),
              Text(
                '2. How We Use Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                'Since we do not collect personal information, there is no information to use for any purpose.',
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),
              Divider(height: 30,),
              Text(
                '3. Information Sharing and Disclosure',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                'Skink does not share personal information with third parties. User-generated content may be publicly visible within the app.',
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),
              Divider(height: 30,),
              Text(
                '4. Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                'We prioritize the security of your information. However, no method of transmission over the internet or electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.',
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),


              Text(
                'Last Updated: [16-01-2024]',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic,color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


